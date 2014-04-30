import megamu.mesh.*;

/**
 * This sketch needs the mesh library (http://www.leebyron.com/else/mesh/) to calculate the voronoi diagram
 */

ArrayList<PVector> points; 
boolean doAnimate = true;
boolean doDrawVoronoi = true;


void setup() {
  size(600, 600);
  points = createLumpyRandomPoints(200);

  frameRate(25);
}


void draw() {
  background(255);

  /* Draw points */
  noStroke();
  fill(255, 69, 0);
  for (PVector p : points) {
    ellipse(p.x, p.y, 5, 5);
  }

  /* Calculate new voronoi diagram */
  float[][] voronoiPoints = new float[points.size()][2];      // the library only takes an array of coordinates...

  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    voronoiPoints[i][0] = p.x;
    voronoiPoints[i][1] = p.y;
  }

  Voronoi voronoi = new Voronoi(voronoiPoints);


  /* Convert the strange stuff to our own polygon class... */
  MPolygon[] voronoiRegions = voronoi.getRegions();
  ArrayList<Poly> ourPolygons = new ArrayList<Poly>();

  for (int i = 0; i < voronoiRegions.length; i++) {
    float[][] regionCoordinates = voronoiRegions[i].getCoords();

    Poly ourPoly = new Poly(regionCoordinates);
    ourPolygons.add(ourPoly);
  }

  /* Draw them and draw their centroid (little cross) */
  if (doDrawVoronoi) {
    noFill();
    stroke(128);

    for (Poly poly : ourPolygons) {
      poly.draw();
    }

    for (Poly poly : ourPolygons) {
      PVector centroid = poly.centroid();

      cross(centroid.x, centroid.y, 10);
    }
  }

  /* Create a new set of points at the centroid, but take care that the point does not leave the sketch...*/
  if (doAnimate) {
    points.clear();   // empty

    for (Poly poly : ourPolygons) {
      PVector centroid = poly.centroid();    

      centroid.x = constrain(centroid.x, 0, width) + random(-1, 1);    // the random is cheating so points are not on top of each other...
      centroid.y = constrain(centroid.y, 0, height)  + random(-1, 1);

      points.add(centroid);
    }
  }
}


ArrayList<PVector> createLumpyRandomPoints(int theNumber) {
  ArrayList<PVector> newPoints = new ArrayList<PVector>();

  for (int i = 0; i < theNumber; i++) {
    float x = constrain(map(randomGaussian(), -6, 6, 0, width), 0, width);
    float y = constrain(map(randomGaussian(), -6, 6, 0, height), 0, height);

    PVector p = new PVector(x, y);

    newPoints.add(p);
  } 

  return newPoints;
}


void cross(float theX, float theY, float theSize) {
  float half = theSize * 0.5f;
  line(theX - half, theY, theX + half, theY);       // -
  line(theX, theY + half, theX, theY - half);      // |
}



void keyPressed() {
  if (key == 'c') {
    points = createLumpyRandomPoints(200);
  }  

  if (key == ' ') {
    doAnimate = !doAnimate;
  }

  if (key == 'd') {
    doDrawVoronoi = !doDrawVoronoi;
  }
}


PVector startP;  // start of the line
PVector endP;  // end of the line

void setup() {
  size(600, 600);

  startP = new PVector(random(0, width), random(0, height)); 
  endP = new PVector(random(0, width), random(0, height));
}


void draw() {
  background(255);

  noFill();
  stroke(52);

  line(startP.x, startP.y, endP.x, endP.y);

  PVector mouseP = new PVector(mouseX, mouseY);

  if (distanceSegmentPoint(startP, endP, mouseP) < 50) {
    noStroke();
    fill(255, 69, 0);
  } 
  else {
    stroke(52);
    noFill();
  }

  ellipse(mouseP.x, mouseP.y, 100, 100);
}



/**
 * Calculates the distance of a point to a given line segment in 2D
 * Stolen from: http://paulbourke.net/geometry/pointlineplane/
 * 
 * @param theA the first point of the line segment
 * @param theB the second point of the line segment
 * @param thePoint the point to check against.
 * @return the closest distance of the given point to the line segment
 */
float distanceSegmentPoint(PVector theA, PVector theB, PVector thePoint) {
  float dX = theB.x - theA.x;
  float dY = theB.y - theA.y;

  if ((dX == 0) && (dY == 0)) {  // Line is just a point
    return theA.dist(thePoint);
  }

  float u = ((thePoint.x - theA.x) * dX + (thePoint.y - theA.y) * dY) / (dX * dX + dY * dY);

  PVector closestPoint;
  if (u < 0) {
    closestPoint = theA;
  } 
  else if (u > 1) {
    closestPoint = theB;
  } 
  else {
    closestPoint = new PVector(theA.x + u * dX, theA.y + u * dY);
  }

  return closestPoint.dist(thePoint);
}


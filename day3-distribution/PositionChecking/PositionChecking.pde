ArrayList<Point> points;


void setup() {
  size(600, 600);

  points = new ArrayList<Point>();

  for (int i = 0; i < 1000; i++) {
    Point newPoint = new Point(random(width), random(height));
    points.add(newPoint);
  }
}


void draw() {
  background(52);

  float maxDistance = 40;
  PVector target = new PVector(mouseX, mouseY);

  noStroke();
  fill(255, 69, 0);
  ellipse(target.x, target.y, 10, 10);

  stroke(255);
  noFill();
  ellipse(target.x, target.y, maxDistance * 2.0, maxDistance * 2.0);

  /* Collect all points in range to a list. All others to another */
  ArrayList<Point> pointsInRange = new ArrayList<Point>();
  ArrayList<Point> pointsNotInRange = new ArrayList<Point>();

  for (int i = 0; i < points.size(); i++) {
    Point point = points.get(i);

    if (distSquared(point.position, target) < maxDistance * maxDistance) {   // faster alternative
      pointsInRange.add(point);
    } 
    else {
      pointsNotInRange.add(point);
    }
  }

  /* Draw all in range */
  for (int i = 0; i < pointsInRange.size(); i++) {
    Point point = pointsInRange.get(i);
    point.draw();
  }
  
  /* Draw all out of range with a different draw function */
  for (int i = 0; i < pointsNotInRange.size(); i++) {
    Point point = pointsNotInRange.get(i);
    point.drawInactive();
  }
}


/** Returns the squared distance between two position vectors */
float distSquared(PVector theA, PVector theB) {
  float dX = theA.x - theB.x;
  float dY = theA.y - theB.y;

  return dX * dX + dY * dY;
}


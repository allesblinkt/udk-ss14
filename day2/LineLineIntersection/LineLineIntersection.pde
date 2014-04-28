void setup() {
  size(600, 600);
}


void draw() {
  background(255);

  PVector centerP = new PVector(width * 0.5, height * 0.5); 
  PVector mouseP = new PVector(mouseX, mouseY);

  stroke(0);
  noFill();
  line(centerP.x, centerP.y, mouseP.x, mouseP.y);

  randomSeed(23);  // so random behaves the same way each frame...
  for (int i = 0; i < 20; i++) {
    PVector startP = new PVector(random(width), random(height));
    PVector endP = new PVector(random(width), random(height));

    stroke(150);
    noFill();
    line(startP.x, startP.y, endP.x, endP.y);

    PVector intersection = lineLineIntersect(startP, endP, centerP, mouseP);

    if (intersection != null) {
      noStroke();
      fill(255, 69, 0);

      ellipse(intersection.x, intersection.y, 10, 10);
    }
  }
}


/**
 * Calculates the intersection point of two lines, if they do intersect
 * 
 * @param theFirstA the first point of the first line segment
 * @param theFirstB the second point of the first line segment
 * @param theSecondA the first point of the second line segment
 * @param theSecondB the second point of the second line segment
 * @return a new PVector at the intersection point. null if the lines don't intersect
 */
PVector lineLineIntersect(PVector theFirstA, PVector theFirstB, PVector theSecondA, PVector theSecondB) {
  float denom = ((theSecondB.y - theSecondA.y) * (theFirstB.x - theFirstA.x)) - ((theSecondB.x - theSecondA.x) * (theFirstB.y - theFirstA.y));

  float numeA = ((theSecondB.x - theSecondA.x) * (theFirstA.y - theSecondA.y)) - ((theSecondB.y - theSecondA.y) * (theFirstA.x - theSecondA.x));
  float numeB = ((theFirstB.x - theFirstA.x) * (theFirstA.y - theSecondA.y)) - ((theFirstB.y - theFirstA.y) * (theFirstA.x - theSecondA.x));

  if (denom == 0.0f) {
    if (numeA == 0.0f && numeB == 0.0f) {
      return null;   // lines are coincident
    }

    return null;  // lines are parallel;
  }

  float uA = numeA / denom;
  float uB = numeB / denom;

  if (uA > 0.01f && uA < 0.99f && uB > 0.01f && uB < 0.99f) {  // Prevent intersections near the end of segments

    PVector intersection = new PVector();

    // Get the intersection point.
    intersection.x = theFirstA.x + uA * (theFirstB.x - theFirstA.x);
    intersection.y = theFirstA.y + uA * (theFirstB.y - theFirstA.y);

    return intersection;
  }

  return null;
}


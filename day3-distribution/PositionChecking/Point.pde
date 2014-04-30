class Point {
  PVector position;

  Point(float theX, float theY) {
    position = new PVector(theX, theY);
  } 

  void draw() {
    noStroke();
    fill(255);

    ellipse(position.x, position.y, 10, 10);
  }

  void drawInactive() {
    noStroke();
    fill(80);

    ellipse(position.x, position.y, 5, 5);
  }
}


class Hexagon {
  PVector center;

  PVector[] bary = new PVector[6];

  float radius;

  Hexagon(float theX, float theY, float theR) {
    center = new PVector(theX, theY);

    for (int i = 0; i < 6; i++) {
      float x = sin(i / 6.0 * TWO_PI) * theR;
      float y = -cos(i / 6.0 * TWO_PI) * theR;

      PVector b = new PVector(x, y);
      bary[i] = b;
    }


    radius = theR;
  }

  void draw() {
    pushMatrix();
    translate(center.x, center.y);
    
    noStroke();
    
    fill(255, 0, 0);
    drawHexagon(radius);
    
    float ir = map(sin(millis() * 0.001), -1, 1, radius * 0.1, radius);
    fill(0, 255, 255);
    drawHexagon(ir);

    popMatrix();
  }
  
  
    void drawDebug() {

    pushMatrix();
    translate(center.x, center.y);


    noStroke();
    
    
    fill(255);
    drawHexagon(radius);
    
    fill(0);
    drawHexagon(radius * 0.1);

    popMatrix();
  }



  void drawHexagon(float theRadius) {
    beginShape();

    for (int i = 0; i < 6; i++) {
      float x = sin(i / 6.0 * TWO_PI) * theRadius;
      float y = -cos(i / 6.0 * TWO_PI) * theRadius;

      vertex(x, y);
    }
    endShape();
  }
}


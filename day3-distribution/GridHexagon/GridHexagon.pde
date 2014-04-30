void setup() {
  size(600, 600);
}


void draw() {
  background(255);

  float radius = 20;
  
  fill(255, 69, 0);
  noStroke();
  
  translate(50, 50);

  for (int r = 0; r < 15; r++) {
    for (int c = 0; c < 12; c++) {
      float x = c * radius * 2.0;
      float y = r * radius * 2.0 * sqrt(3) * 0.5;

      if (r % 2 == 0) {   // every other row
        x += radius;
      }

      drawHexagon(x, y, radius * 2.0);
    }
  }
}



void drawHexagon(float theX, float theY, float theSize) {
  beginShape();

  for (int i = 0; i < 6; i++) {
    float x = theX + sin(i / 6.0 * TWO_PI) * theSize * 0.5;
    float y = theY - cos(i / 6.0 * TWO_PI) * theSize * 0.5;

    vertex(x, y);
  }
  
  endShape(CLOSE);
}


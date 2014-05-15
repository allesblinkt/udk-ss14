void setup() {
  size(500, 500, P2D);    // works only with the OpenGL based renderers (OPENGL, P3D, P2D)
  // size(500, 500, P2D);
}

void draw() {
  background(0);

  translate(width * 0.5, height * 0.5);    // center

  stroke(255);
  beginShape();
  
  fill(255, 69, 0);   // for the upper two
  vertex(-100, -200);
  vertex(100, -200);
  
  fill(255);  // lower two
  vertex(100, 200);
  vertex(-100, 200);

  endShape(CLOSE);
}


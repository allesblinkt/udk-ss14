boolean isIntroOver = false;

void setup() {
  size(500, 500);
}

void draw() {
  pushMatrix();
  
  if (isIntroOver) {
    drawMain();
  } 
  else {
    drawIntro();
  }
  
  popMatrix();
    
  text("I am a sketch", 300, 100);
}

void drawIntro() {
  background(0);
  text("Hello", 20, 100);
}

void drawMain() {
  background(255, 69, 0);

  translate(width * 0.5, height * 0.5);
  rotate(millis() * 0.001);

  rect(0, 0, 200, 200);
}

void mouseClicked() {
  isIntroOver = true;
}


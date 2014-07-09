PGraphics canvas;

void setup() {
  size(1000, 1000, P2D);

  canvas = createGraphics(500, 500, JAVA2D);
}

void draw() {
  background(255, 69, 0);

  canvas.beginDraw();
  canvas.background(0);
  canvas.fill(255);
  canvas.noStroke();
  canvas.ellipse(100, 100, 100, 100);
  canvas.ellipse(150, 150, 100, 100);
    
  canvas.endDraw();

  PImage canvasImage = canvas.get();
  image(canvas, 100, 100, 200, 200);

  canvasImage.filter(BLUR, map(mouseX, 0, width, 0, 20));
  canvasImage.filter(THRESHOLD, map(mouseY, 0, height, 0, 1.0));
  
  image(canvasImage, 300, 300, 200, 200);
}


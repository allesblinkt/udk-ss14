void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  noStroke();
  fill(255, 69, 0);
  
  int cols = round(map(mouseX, 0, width, 0, 100));
  int rows = round(map(mouseY, 0, height, 0, 100));

  for (int i = 0; i < cols; i++) {
    float x = map(i, 0, cols - 1, 0, width);

    for (int j = 0; j < rows; j++) {
      float y = map(j, 0, rows - 1, 0, height);

      ellipse(x, y, 5, 5);
    }   
  }
}


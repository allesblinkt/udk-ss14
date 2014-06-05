int numCols = 100;  // Number of columns
int numLines = 4;   // Number of lines per column

float marginX = 20.0;
float marginY = 20.0;

float unit = 10.0;


void setup() {
  size(800, 800);
}


void draw() {
  background(0);

  stroke(255);
  noFill();
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(2.0);

  randomSeed(23);    // same random sequence every time...

  for (int i = 0; i < numCols; i++) {
    float x = map(i, 0, numCols - 1, marginX, width - marginX);    // Which x position are we with the column.

    float gap = unit * round(random(1, 5));
    float lineHeight = unit * round(random(5, 15));

    for (int j = 0; j < numLines; j++) {
      float startY = height - (j * (gap + lineHeight) + marginY);    // start is at the bottom
      float endY = startY - lineHeight;   

      line(x, startY, x, endY);
    }
  }
}


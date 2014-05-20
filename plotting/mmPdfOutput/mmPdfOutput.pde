/** Creates a simple PDF with sizes in mm */
import processing.pdf.*;

float MM_TO_PT_FACTOR = 72 / 25.4;

int widthPt = int(210 * MM_TO_PT_FACTOR);
int heightPt = int(297 * MM_TO_PT_FACTOR);

void setup() {
  size(widthPt, heightPt, PDF, "a4.pdf");
  
  noLoop();   // only one frame
}


void draw() {
  background(255);
  stroke(0);

  line(0, 0, width, height);
  line(width, 0, 0, height);
    
  exit();   // save...
}


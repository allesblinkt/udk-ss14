import processing.pdf.*;

/**
 * For PDF output one pixel unit in Processing becomes one point in the PDF.
 * Those are the same points that also exist in Illustrator.
 * One inch are 72 points
 *
 * 1 inch = 72 pt
 * 1 pt = 1 / 72 inch
 * 1 inch = 25.4 mm
 * 1 pt =  25.4 / 72 mm
 * 1 mm = 72 / 25.4 pt
 * 
 * Press r to record a PDF!
 */

import processing.pdf.*;

boolean doRecord = false;

void setup() {
  int widthPt = int(mmToPt(100));    // 10 cm
  int heightPt = int(mmToPt(100));  // 10 cm
  
  size(widthPt, heightPt);
  smooth();  
}

void draw() {
  background(255);  // paper is white
  
  /* Start recording */
  if (doRecord) {
    String recordFile = "output-" + timestamp() + ".pdf";
    println("Recording graphics to " + recordFile);
    
    beginRecord(PDF, recordFile);
  }
        
  /* Actual graphics */
  noFill();
  
  stroke(0);
  ellipse(width * 0.5, height * 0.5, width * 0.75, height * 0.75);
  
  stroke(255, 0, 0);
  ellipse(width * 0.5, height * 0.5, width * 0.25, height * 0.25);

  /* End recording */
  if (doRecord) {
    endRecord();
    doRecord = false;
  }

  /* Do not write this stuff to the PDF, because it is after endRecord... */
  stroke(128);
  ellipse(width - 50, height - 50, 100, 100);  
}

void keyPressed() {
  if (key == 'r') {
    doRecord = true;
    println("Recording done.");
  }
}

/** Converts a length in mm to points */
float mmToPt(float theMm) {
  float mmToPointFactor = 72 / 25.4;
  return theMm * mmToPointFactor;
}

/* Converts a length in points to mm */
float ptToMm(float thePt) {
  float mmToPointFactor = 72 / 25.4;
  return thePt / mmToPointFactor;
}

/** Returns a timestamp string like 131201-162711   (YYMMDD-hhmmss) */
String timestamp() {
  String date = nf(year(), 2) + nf(month(), 2) + nf(day(), 2);
  String time = nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  return  date + "-" + time;
}

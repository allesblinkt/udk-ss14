PImage image;
boolean drawImage = true;

int pointsToDistribute = 2000;


ArrayList<PVector> points;

void setup() {
  size(600, 600);

  image = loadImage("black_q.png");
  points = new ArrayList<PVector>();
}


void draw() {
  background(255);

  if (drawImage) {
    image(image, 0, 0);
  }

  if (points.size() < pointsToDistribute) {
    int x = floor(random(0, image.width));
    int y = floor(random(0, image.height));
    PVector p = new PVector(x, y);

    noStroke();
    fill(52);
    ellipse(p.x, p.y, 10, 10);

    float brightness = brightness(image.get(x, y));

    if (brightness < 128) {    // black
      points.add(p);
    }
  }

  noStroke();
  fill(255, 69, 0);

  /* Draw points */
  for (PVector p : points) {
    ellipse(p.x, p.y, 5, 5);
  }
}


void keyPressed() {
  if (key == 'd') {
    drawImage = !drawImage;
  }

  if (key == 'c') {
    points.clear();
  }
}


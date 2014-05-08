// Libraries: ControlP5 -> http://www.sojamo.de/libraries/controlP5/
import controlP5.*;

ControlP5 cp5;

// Min max for mapping...
float minTemperature = -55.0;
float maxTemperature = 55.0;

float minUvIndex = 0.0;
float maxUvIndex = 12.0;

// Value sliders
float temperature = 20.0;    // Grad Celsius
float uvIndex = 2.0;    // http://en.wikipedia.org/wiki/Ultraviolet_index

// Other parameter sliders
float innerRadius = 50.0;
float radiusIncrement = 10.0;
float baseStrokeWeight = 4.0;


void setup() {
  size(600, 600, JAVA2D);

  cp5 = new ControlP5(this);
  cp5.addSlider("temperature", minTemperature, maxTemperature).linebreak();
  cp5.addSlider("uvIndex", minUvIndex, maxUvIndex).linebreak();

  cp5.addSlider("innerRadius", 0.0, 100.0).linebreak();
  cp5.addSlider("radiusIncrement", 0.0, 50.0).linebreak();
  cp5.addSlider("baseStrokeWeight", 0.5, 10.0).linebreak();
}


void draw() {
  background(10);

  pushMatrix();
  translate(width * 0.5, height * 0.5);   // 0, 0 in der Mitte

  // Style
  noFill();
  stroke(255);

  strokeWeight(baseStrokeWeight);
  strokeCap(ROUND);
  strokeJoin(ROUND);

  // Temperatur (innen)
  float temperatureAngle = map(temperature, minTemperature, maxTemperature, 0, TWO_PI);
  float temperatureRadius = innerRadius;
  arc(0, 0, temperatureRadius * 2.0, temperatureRadius * 2.0, 0, temperatureAngle, OPEN);

  // UV (Mitte)
  float uvAngle = map(uvIndex, minUvIndex, maxUvIndex, 0, TWO_PI);
  float uvRadius = innerRadius + 1.0 * radiusIncrement;
  arc(0, 0, uvRadius * 2.0, uvRadius * 2.0, 0, uvAngle, OPEN);
  
  // UV (aussen) (90 Grad gedreht, zum Beispiel...)
  float uvAngle2 = map(uvIndex, minUvIndex, maxUvIndex, 0, TWO_PI);
  float uvRadius2 = innerRadius + 2.0 * radiusIncrement;
  arc(0, 0, uvRadius2 * 2.0, uvRadius2 * 2.0, HALF_PI, HALF_PI + uvAngle2, OPEN);

  popMatrix();
}





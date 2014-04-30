LSystem lsystem;

void setup() {
  size(800, 600);
  smooth(); 
  
  LRule[] rules = { 
    new LRule("X", "F-[[X]+X]+F[+FX]-X"),
    new LRule("F", "FF")
  };
  
  lsystem = new LSystem("X", rules);
}

void draw() {
  background(200);
  translate(width * 0.5, height);

  noFill();
  stroke(255, 69, 0);
  lsystem.theta = map(mouseX, 0, width, radians(2), radians(40));
  lsystem.reset();
  lsystem.simulate(4);
  lsystem.draw();
}

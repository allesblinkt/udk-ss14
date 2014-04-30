class LSystem {

  String axiom;
  LRule[] rules;

  String produced;

  float startLength = 5.0;
  float drawLength = 5.0;

  float theta = radians(10); 

  public LSystem(String axiom, LRule[] rules) {
    this.axiom = axiom;
    this.rules = rules; 

    this.produced = axiom;
  }


  void reset() {
    produced = axiom;
    drawLength = startLength;
  }


  void simulate(int count) {
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < rules.length; j++) {
        LRule rule = rules[j]; 
        produced = applyRule(produced, rule);
      }
    }
  }


  String applyRule(String prod, LRule rule) {
    //    drawLength = drawLength * 0.6;
    //    generations++;
    String newProduction = prod;          
    newProduction = newProduction.replaceAll(rule.from, rule.to);
    return newProduction;
  }


  void draw() {    
    for (int i = 0; i < produced.length(); i++) {
      char command = produced.charAt(i);

      switch (command) {
      case 'F':
        line(0, 0, 0, -drawLength);
        translate(0, -drawLength);
        break;

      case '+':
        rotate(theta);
        break;

      case '-':
        rotate(-theta);
        break;

      case '[':
        pushMatrix();
        break;

      case ']':
        popMatrix();
        break;

      case 'X':
        // Do nothing
        break;        

      default:
        println("Unknown character in axiom");
        break;
      }
    }
  }
}


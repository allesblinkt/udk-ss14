import java.util.List;


class Poly {
  ArrayList<PVector> vertices = new ArrayList<PVector>();

  Poly() {
  }


  Poly(List<PVector> thePoints) {
    for (PVector p : thePoints) {
      vertices.add(p.get());
    }
  }


  Poly(PVector... thePoints) {
    for (PVector p : thePoints) {
      vertices.add(p.get());
    }
  }


  Poly(float[][] theCoordinates) {
    for (int i = 0; i < theCoordinates.length; i++) {
      float x = theCoordinates[i][0];
      float y = theCoordinates[i][1];

      PVector p = new PVector(x, y);
      vertices.add(p);
    }
  }


  void draw() {
    beginShape();

    for (PVector p : vertices) {
      vertex(p.x, p.y);
    }

    endShape(CLOSE);
  }


  void draw(PGraphics theG) {
    theG.beginShape();

    for (PVector p : vertices) {
      theG.vertex(p.x, p.y);
    }

    theG.endShape(CLOSE);
  }


  /** 
   * Checks if the polygon contains a point
   */
  boolean contains(PVector theP) {
    int num = vertices.size();
    int i, j = num - 1;

    boolean isOdd = false;
    float px = theP.x;
    float py = theP.y;
    for (i = 0; i < num; i++) {
      PVector vi = vertices.get(i);
      PVector vj = vertices.get(j);
      if (vi.y < py && vj.y >= py || vj.y < py && vi.y >= py) {
        if (vi.x + (py - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < px) {
          isOdd = !isOdd;
        }
      }
      j = i;
    }

    return isOdd;
  }


  /** 
   * Checks if the polygon contains another polygon
   */
  boolean contains(Poly theOther) {
    for (PVector p : theOther.vertices) {
      if (!contains(p)) {
        return false;
      }
    }

    return true;
  }


  /**
   * Computes the centroid (center of mass) of the polygon.
   * See http://paulbourke.net/geometry/polygonmesh/
   * 
   * @return a new PVector describing the centroid
   */
  public PVector centroid() {
    PVector res = new PVector();

    assert vertices.size() > 2: 
    "A polygon needs to have at least three points";

    int num = vertices.size();
    for (int i = 0; i < num; i++) {
      PVector a = vertices.get(i);
      PVector b = vertices.get((i + 1) % num);   // next or first

      float crossP = a.x * b.y - b.x * a.y;

      res.x += (a.x + b.x) * crossP;
      res.y += (a.y + b.y) * crossP;
    }

    float scale = 1.0 / (6.0 * area());
    res.mult(scale);

    return res;
  }



  /**
   * Computes the area of the polygon.
   * The polygon must not be self-intersecting
   * See http://paulbourke.net/geometry/polygonmesh/
   * 
   * @return the area of the polygon
   */
  float area() {
    float area = 0;

    int num = vertices.size();
    for (int i = 0; i < num; i++) {
      PVector a = vertices.get(i);
      PVector b = vertices.get((i + 1) % num);   // next or first
      area += a.x * b.y;
      area -= a.y * b.x;
    }
    area *= 0.5;
    return area;
  }
}


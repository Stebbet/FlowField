class Particle {

  PVector pos;
  PVector spd;
  PVector acc;
  Particle(int x, int y) {
    pos = new PVector(x, y);
    spd = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    stroke(255, 5);
    strokeWeight(1);
    point(pos.x, pos.y);
  }

  void update(PVector[][] f) {
    edges();
    acc.add(checkBounds(f));
    spd.add(acc);
    spd.limit(2);
    pos.add(spd);
    acc.mult(0);
  }

  void edges() {
    if (pos.x > width - 1) pos.x = 1;
    if (pos.x < 1) pos.x = width - 1;
    if (pos.y > height - 1) pos.y = 1;
    if (pos.y < 1) pos.y = height - 1;
  }

  PVector checkBounds(PVector[][] f) {
    for (int i = 0; i < f.length; i++) {
      int y = i * scale;
      for (int j = 0; j < f[i].length; j++) {
        int x = j * scale;
        if (pos.x >= x && pos.x <= x + scale && pos.y >= y && pos.y <= y + scale) {
          return f[i][j];
        }
      }
    }
    return new PVector(0, 0);
  }
}

class Walker {
  float x, y, Vx, Vy;
  
  Walker(float xx, float yy) {
    x = xx;
    y = yy;
    Vx = random(100);
    Vy = random(100);
  }
  
  void update() {
    x += map(noise(Vx), 0, 1, -9, 9);
    y += map(noise(Vy), 0, 1, -9, 9);

    Vx += 0.008;
    Vy += 0.008;
  }
  
  void show() {
   strokeWeight(7);
   stroke(255);
   point(x, y);
  }
}

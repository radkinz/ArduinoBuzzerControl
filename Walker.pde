class Walker {
  float x, y, Vx, Vy;
  color c;
  
  Walker(float xx, float yy, color cc) {
    x = xx;
    y = yy;
    Vx = random(100);
    Vy = random(100);
    c = cc;
  }
  
  void update() {
    x += map(noise(Vx), 0, 1, -9, 9);
    y += map(noise(Vy), 0, 1, -9, 9);

    Vx += 0.008;
    Vy += 0.008;
  }
  
  void show() {
   strokeWeight(7);
   stroke(c);
   point(x, y);
  }
}

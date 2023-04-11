
float xoff = 0;
float yoff = 0;
float zoff = 0;
int scale = 10;
int cols;
int rows;
int particleNum = 1000;
ArrayList<Particle> particles = new ArrayList();

PVector[][] flow;


void setup() {
  size(1000, 1000);
  background(0);
  for (int i = 0; i < particleNum; i++) {
    particles.add(new Particle(floor(random(0, width)), floor(random(0, height))));
  }

  cols = floor(width / scale);
  rows = floor(height / scale);
  flow = new PVector[cols][rows];
  yoff = 0;
  
}

void draw() {
  //background(0);
  translate(scale / 2, scale/ 2);
  yoff = 0;
  for (int y = 0; y < cols; y++) {
    yoff+=0.14;
    xoff = 0;
    for (int x = 0; x < rows; x++) {
      xoff+= 0.14;
      float noise = noise(xoff, yoff, zoff) * TWO_PI;
      flow[y][x] = new PVector(scale, 0);
      flow[y][x].rotate(noise);
      //flow[y][x].setMag(0.05);
    }
  }
  zoff += 0.005;
  //drawLines();
  drawParticles();
  
}

void drawParticles() {
  for (Particle p : particles) {
    p.update(flow);
    p.show();
  }
}

void drawLines() {
  for (int y = 0; y < cols; y++) {
    for (int x = 0; x < rows; x++) {
      line(x * scale, y * scale, (x*scale) + flow[y][x].x, (y*scale) + flow[y][x].y);
    }
  }
}

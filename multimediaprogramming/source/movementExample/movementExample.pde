int newNoiseSeed = (int) random(100000);
int maxBall = 256;
ArrayList<Ball> objects = new ArrayList<Ball>();

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void keyPressed() {
  if (key == ' ') background(255);
}

void draw() {
  if (mousePressed && objects.size() < maxBall) {
    objects.add( new Ball( mouseX, mouseY ));
  }

  for (int i = 0; i < objects.size(); i++) {
    Ball b = objects.get(i);
    b.addPerlin();
    b.update();
    b.drawMe();
  }
}

class Ball {
  PVector pos, pPos, vel, acc;
  float damp, weight;
  color c;

  Ball(float xPos, float yPos) {
    pos = new PVector(xPos, yPos);
    pPos = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    damp = 0.99;
    weight = 1;
    c = color(0, random(128), random(128, 255), 16);
  }

  void update() {
    vel.add(acc);
    vel.mult(damp);
    pPos.set(pos.x, pos.y, 0);
    pos.add(vel);
    acc.set(0, 0, 0);
    outside();
  }

  void outside() {
    if (pos.x > width || pos.x < 0
      || pos.y > height || pos.y < 0) {
      objects.remove(this);
    };
  }
  
  void addPerlin() {
    float depth = 0.006;
    float bright = 15 * noise(pos.x * depth, pos.y * depth, newNoiseSeed);
    PVector perlin = new PVector( cos(bright), sin(bright) );
    //perlin.mult(0.04);
    acc.add( perlin );
    vel.limit(4);
  }

  void drawMe() {
    stroke(c);
    strokeWeight(weight);
    line(pos.x, pos.y, pPos.x, pPos.y);
  }
}


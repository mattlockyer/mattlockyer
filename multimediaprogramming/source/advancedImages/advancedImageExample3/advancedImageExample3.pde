PImage img;
int channel = 0;
int maxBall = 256;
ArrayList<Ball> objects = new ArrayList<Ball>();

void setup() {
  size(600, 400);
  background(255);
  smooth();

  img = loadImage("colors.jpg");
}

void keyPressed() {
  if (key == ' ') {
    background(255);
    objects.clear();
  }
  if (key == CODED) {
    if (keyCode == UP) {
      channel++;
      if (channel > 3) channel = 0;
    } 
    else if (keyCode == DOWN) {
      channel--;
      if (channel < 0) channel = 3;
    }
  }
}

void draw() {
  if (mousePressed && objects.size() < maxBall) {
    objects.add( new Ball( mouseX, mouseY ));
  }

  for (int i = 0; i < objects.size(); i++) {
    Ball b = objects.get(i);
    b.channelToAngle();
    b.update();
    b.drawMe();
  }

  switch (channel) {
  case 0: 
    fill(255, 0, 0); 
    rect(0, 0, 50, 50); 
    break;
  case 1: 
    fill(0, 255, 0); 
    rect(0, 0, 50, 50); 
    break;
  case 2: 
    fill(0, 0, 255); 
    rect(0, 0, 50, 50); 
    break;
  case 3: 
    fill(255, 255, 255); 
    rect(0, 0, 50, 50); 
    break;
  }
}

class Ball {
  PVector pos, pPos, vel, acc;
  float damp, mass;
  color c;
  int life;

  Ball(float xPos, float yPos) {
    pos = new PVector(xPos, yPos);
    pPos = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    damp = 0.99;
    mass = random(1, 4);
    c = color(0, 0, 0);
    life = 255;
  }

  void update() {
    //update position
    vel.add(acc);
    vel.mult(damp);
    pPos.set(pos.x, pos.y, 0);
    pos.add(vel);
    acc.set(0, 0, 0);
    //check if outside
    outside();
    //update color
    c = img.get( (int) pos.x, (int) pos.y );
    life--;
    if (life < 0) {
      objects.remove(this);
    }
  }

  void outside() {
    if (pos.x > width || pos.x < 0
      || pos.y > height || pos.y < 0) {
      objects.remove(this);
    };
  }

  void channelToAngle() {
    float bright = 0;
    switch (channel) {
    case 0: 
      bright = red(c); 
      break;
    case 1: 
      bright = green(c); 
      break;
    case 2: 
      bright = blue(c); 
      break;
    case 3: 
      bright = brightness(c); 
      break;
    }
    bright *= 0.04;

    PVector forceVector = new PVector( cos(bright), sin(bright) );
    //forceVector.mult(0.4);
    acc.add( forceVector );
    vel.limit(1);
  }

  void drawMe() {
    stroke(c);
    strokeWeight(mass);
    line(pos.x, pos.y, pPos.x, pPos.y);
  }
}


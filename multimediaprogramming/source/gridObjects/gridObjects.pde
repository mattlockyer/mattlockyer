
int gridSize = 8;
MyShape[][] shapes = new MyShape[gridSize][gridSize];

void keyPressed(){
  if (key == 's') {
    save("frame" + frameCount + ".jpg");
  }
}
void setup() {
  size(600, 600); 
  int gridSpace = width/gridSize;
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      if (random(1) < 0.5) {
        shapes[i][j] = new MyShape(i * gridSpace + gridSpace/2, j * gridSpace + gridSpace/2);
      } else {
        shapes[i][j] = new MyOtherShape(i * gridSpace + gridSpace/2, j * gridSpace + gridSpace/2);
      }
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      //if (mousePressed) {
        shapes[i][j].updateRotation(mouseX, mouseY);
        shapes[i][j].updateScale(mouseX, mouseY);
        shapes[i][j].updateColor(mouseX, mouseY);
      //}
      shapes[i][j].drawMe();
    }
  }
}



class MyShape {

  int x, y;
  float shapeScale, rot;
  color c;
  float distance;

  MyShape() {
  }
  MyShape(int startX, int startY) {
    x = startX;
    y = startY;
    shapeScale = 1;
    rot = 0;
    c = color(random(128, 255), random(64), 0);
  } 
  void updateRotation(int mX, int mY) {
    rot = atan2(mY - height/2, mX - width/2);
  }
  void updateScale(int mX, int mY) {
    shapeScale = 1 + 4 * abs(mouseY - y)/(float)height;
  }
  void updateColor(int mX, int mY) {
    distance = 1 - dist(mX, mY, x, y) / width;
    c = color(red(c), green(c), distance * 255);
  }
  void drawMe() {
    fill(c, 128);
    stroke(0, 64);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    rotate(rot);
    scale(shapeScale);
    rect(-16, -8, 32, 16);
    rect(-8, -16, 16, 32);
    popMatrix();
    if (distance > 0.5) {
      pushMatrix();
      translate(x, y);
      rect(-16, -8, 32, 16);
      rect(-8, -16, 16, 32);
      popMatrix();
    
    }
  }
}

class MyOtherShape extends MyShape {
  
  MyOtherShape(int startX, int startY) {
    super(startX, startY);
  } 
  void drawMe() {
    fill(c, 128);
    stroke(0, 64);
    strokeWeight(2);
    pushMatrix();
    translate(x, y);
    scale(shapeScale);
    rotate(rot);
    ellipse(-8, 0, 16, 16);
    ellipse(8, 0, 16, 16);
    ellipse(0, 8, 16, 16);
    ellipse(0, -8, 16, 16);
    if (distance > 0.5) {
      noFill();
      rect(0, 0, 1, height);
      rect(0, 0, width, 1);
    }
    popMatrix();
  }
}


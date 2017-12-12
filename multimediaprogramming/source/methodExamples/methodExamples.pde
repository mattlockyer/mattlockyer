/*
void setup() {
  size(400, 400);
  background(255);
  
  drawStar();
}

void drawStar() {
  stroke(0, 128);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  vertex(0, -160);
  vertex(-60, -80);
  vertex(-160, -80);
  vertex(-60, -20);
  vertex(-160, 100);
  vertex(0, 20);
  vertex(160, 100);
  vertex(60, -20);
  vertex(160, -80);
  vertex(60, -80);
  endShape(CLOSE);
  popMatrix();
}
*/

/*
void setup() {
  size(400, 400);
  background(255);
  fill(0);

  text( add2ints(5, 5), 50, 50 );
  text( add2floats(5, 5), 50, 70 );
}
int add2ints(int x, int y) {
  return x + y;
}
float add2floats(float x, float y) {
  return x + y;
}
*/

/*
void setup() {
  size(120, 120);
  background(255);
  fill(0);

  text( addInts(5, 5), 50, 50 );
  text( addInts(5, 5, 5), 50, 70 );
  text( addInts(5, 5, 5, 5), 50, 90 );
}
int addInts(int x, int y) {
  return x + y;
}
int addInts(int x, int y, int z) {
  return x + y + z;
}
int addInts(int x, int y, int z, int w) {
  return x + y + z + w;
}
*/

void setup() {
  size(400, 400);
  background(255);
}
void draw() {
  if (keyPressed) {
    if (key == ' ') {
      background(255);
    }
  }
  if (mousePressed) {
    float mouseVelocity = dist(mouseX, mouseY, pmouseX, pmouseY)/128;
    float mouseAngle = atan2(mouseY - pmouseY, mouseX - pmouseX) + PI/2;
    drawStar(mouseX, mouseY, mouseAngle, mouseVelocity );
  }
}

void drawStar(int starX, int starY, float starAngle, float starScale) {
  stroke(0, 128);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  pushMatrix();
  translate(starX, starY);
  rotate(starAngle);
  scale(starScale);
  beginShape();
  vertex(0, -160); vertex(-60, -80); vertex(-160, -80); vertex(-60, -20); vertex(-160, 100); vertex(0, 20); vertex(160, 100); vertex(60, -20); vertex(160, -80); vertex(60, -80);
  endShape(CLOSE);
  popMatrix();
}

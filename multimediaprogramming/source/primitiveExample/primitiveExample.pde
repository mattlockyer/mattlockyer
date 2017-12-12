float xPos;
float yPos;

void setup() {
  size(400, 400);
  xPos = width/2;
  yPos = height/2;
}

void draw() {
  background(255);

  fill(0);
  text("mouseX: " + mouseX, 100, 260);
  text("mouseY: " + mouseY, 100, 280);
  text("xPos: " + xPos, 100, 300);
  text("yPos: " + yPos, 100, 320);

  stroke(0, 128);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  
  xPos += (mouseX - xPos)/20;
  yPos += (mouseY - yPos)/20;
  
  pushMatrix();
  translate(xPos, yPos);
  ellipse(0, 0, 64, 64);
  popMatrix();
}
      

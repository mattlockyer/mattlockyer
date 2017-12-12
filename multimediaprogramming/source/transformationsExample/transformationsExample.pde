void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  stroke(0, 128);
  strokeWeight(2);
  
  pushMatrix();
  translate( mouseX, mouseY );
  
  pushMatrix();
  rotate( (float) mouseX / 400 * PI * 2 );
  scale( (float) mouseY / 100 );
  fill(255, 0, 0, 128);
  rect(-20, -20, 40, 40);
  popMatrix();
  
  pushMatrix();
  translate( 100, 0 );
  rotate( (float) mouseX / -400 * PI * 2 );
  scale( (float) mouseY / 100 );
  fill(0, 255, 0, 128);
  rect(-20, -20, 40, 40);
  popMatrix();
  
  pushMatrix();
  translate( -100, 0 );
  rotate( (float) mouseX / -400 * PI * 2 );
  scale( (float) mouseY / 100 );
  fill(0, 0, 255, 128);
  rect(-20, -20, 40, 40);
  popMatrix();
  
  popMatrix();
}

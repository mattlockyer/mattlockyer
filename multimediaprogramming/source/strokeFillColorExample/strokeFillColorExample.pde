void setup() {
  size(400, 400);
  colorMode(RGB, 400);
}

void draw() {
  noStroke();
  background(400);
  //Column One
  fill( mouseX, mouseY, 0 );
  rect( 50, 50, 100, 100 );
  fill( mouseX, 0, mouseY );
  rect( 50, 150, 100, 100 );
  fill( 0, mouseX, mouseY );
  rect( 50, 250, 100, 100 );
  //Column Two
  fill( mouseX, 0, 0 );
  rect( 150, 50, 100, 100 );
  fill( 0, mouseX, 0 );
  rect( 150, 150, 100, 100 );
  fill( 0, 0, mouseX );
  rect( 150, 250, 100, 100 );
  //Column Three
  fill( mouseY, mouseX, 0 );
  rect( 250, 50, 100, 100 );
  fill( mouseY, 0, mouseX );
  rect( 250, 150, 100, 100 );
  fill( 0, mouseY, mouseX );
  rect( 250, 250, 100, 100 );
}


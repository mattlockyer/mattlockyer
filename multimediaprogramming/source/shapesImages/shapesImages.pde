PFont font;

void setup() {
  size(400, 400);
  font = loadFont("Courier24.vlw");
  textFont(font);
}

void draw() {
  background(255);
  
  strokeWeight(2);
  for(int i = 0; i < 400; i += 20) {
    if (i != 0) {
      if (i == 200) {
        stroke(0, 128);
      } 
      else {
        stroke(0, 64);
      }
      line(i, 0, i, 400);
      line(0, i, 400, i);
    }
  }
  
  /*
  //Cartesian Coordinates
   stroke(255, 0, 0, 128);
  strokeWeight(32);
  point(width/2, height/2);
  
  fill(0);
  text("negative X", 32, height/2 - 24);
  text("positive X", width/2 + 32, height/2 - 24);
  text("(0,0)",  width/2 + 8, height/2 + 36);
  text("positive Y", width/2 - 64, 56);
  text("negative Y", width/2 - 64, 336);
  */
  
  /*
  //Processing Coordinates
  stroke(255, 0, 0, 128);
  strokeWeight(32);
  
  point(0, 0);
  point(width/2, height/2);
  point(width, height);
  
  fill(0);
  text("(0,0)", 8, 24);
  text("(width/2,", width/2 + 12, height/2 + 24);
  text("height/2)", width/2 + 24, height/2 + 48);
  text("(width,height)", width - 208, height - 12);
  
  text("positive Y", width/2 - 64, 56);
  text("positive Y", width/2 - 64, 336);
  text("positive X", 32, height/2 - 24);
  text("positive X", width/2 + 32, height/2 - 24);
  */
  
  /*
  //Points
  fill(0);
  stroke(255, 0, 0, 128);
  strokeWeight(32);
  point(40, 40);
  text("point(40,40);", 40, 64);
  point(100, 240);
  text("point(80,264);", 100, 264);
  */
  
  /*
  //Lines
  fill(0);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  line(40, 40, 320, 260);
  text("line(40,40,320,260);", 50, 300);
  */
  
  /*
  //Ellipses
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  ellipse(200, 200, 320, 240);
  fill(0);
  text("ellipse(200,200,320,240);", 20, 360);
  */
  
  /*
  //Rectangles
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  rect(40, 40, 320, 240);
  fill(0);
  text("rect(40,40,320,240);", 50, 320);
  */
  
  /*
  //Triangles
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  triangle(100, 300, 200, 100, 300, 300);
  fill(0);
  text("triangle(100,300,", 48, 356);
  text("200,100,300,300);", 88, 380);
  */
  
  /*
  //Quads
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  quad(100, 300, 120, 100, 340, 80, 300, 320);
  fill(0);
  text("quad(100,300,120,100,", 48, 356);
  text("340,80,300,320);", 88, 380);
  */
  
  /*
  //Arcs
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  arc(200, 200, 300, 200, -PI/2, PI);
  fill(0);
  text("arc(200,200,", 20, 356);
  text("300,200,-PI/2,PI);", 88, 380);
  text("-PI/2", 200, 80);
  text("PI", 40, 180);
  */
  
  
  //Curves
  fill(255, 0, 0, 64);
  stroke(255, 0, 0, 128);
  strokeWeight(4);
  curve(20, 20, 100, 200, 300, 200, 380, 20);
  stroke(0, 255, 0, 128);
  line(20, 20, 100, 200);
  line(300, 200, 380, 20);
  fill(0);
  text("curve(20,20,100,200,", 20, 356);
  text("300,200,380,20);", 88, 380);
  text("(20,20)", 20, 40);
  text("(380,20)", 260, 40);
  
}

void keyPressed() {
  if (key == 's') {
    save("example" + frameCount + ".png");
  }
}


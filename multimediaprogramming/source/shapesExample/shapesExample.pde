void setup() {
  size(400, 400);
  
  background(255);
  
  stroke(0, 32);
  strokeWeight(2);
  fill(255, 128, 0, 32);
  
  ellipse(width/2, height/2, 300, 200);
  ellipse(width/2, height/2, 200, 300);
  
  rect(width/2 - 60, height/2 - 40, 120, 80);
  rect(width/2 - 40, height/2 - 60, 80, 120);
  
  triangle(100, 0, 200, 300, 300, 0);
  triangle(100, height, 200, 100, 300, height);
  
  quad(0, height, 50, 50, 350, 50, width, height);
  
  arc(0, 40, 80, 80, -PI/2, PI/2);
  arc(width, 40, 80, 80, PI/2, PI * 1.5);
  
  curve(0, -height, 0, height/2, width, height/2, width, height * 2);
  curve(0, height * 2, 0, height/2, width, height/2, width, -height);
  
  line(0, height/2, width, height/2);
}


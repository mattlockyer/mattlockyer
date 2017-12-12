void setup() {
  size(400, 400);
  fill(0);
}

void draw() {
  background(255);

  String sentance = "The quick brown fox jumps over the lazy dog";
  
  int mouseCharPos = min(42, (int)((float) mouseX / 9));
  int endIndex = mouseCharPos + 1;
  int startIndex = max(0, (mouseCharPos-8));
  
  text("length(): " + sentance.length(), 8, 260);
  text("charAt(" + mouseCharPos + "): " + sentance.charAt(mouseCharPos), 8, 280);
  text("substring(0, " + endIndex + "): " + sentance.substring(0, endIndex), 8, 300);
  text("substring(" + startIndex + ", " + endIndex + "): " + sentance.substring(startIndex, endIndex), 8, 320);
}

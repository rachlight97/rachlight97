void headLine() {
  pushMatrix();
  fill(255-sliderValue);
  textFont(font);
  textAlign(CENTER);
  textSize(80);
  text("FITree", 900, 200);
  textSize(20);
  text("Breathe with the nature!", 900, 250);
  textSize(15);
  fill((255-sliderValue)/2);
  text("You have finished "+i+" times.", 900, 280);
  noFill();
  stroke(255-sliderValue);
  rect(690, 90, 410, 210);
  popMatrix();
}
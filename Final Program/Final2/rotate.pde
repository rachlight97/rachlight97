void rotates(){
  pushMatrix();  
  fill(r1, g1, b1);
  translate(sliderTicks2/2,0);
  ellipse(0,0, 50,50);

  rotate(radians(frameCount)*-3);

  for(float m=0; m<12; m++) {
    rect(50,-5, 50,5);
    rotate(radians(30));
  }
  popMatrix();  
}
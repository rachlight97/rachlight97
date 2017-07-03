void ballFalling() {
  int r = int(d+20);
  if (y<600) {
    float gravity=abs(y*0.05);
    y+=s*gravity;
    noStroke();
    ellipse(sliderTicks2/2, y, r, r);
  } else {
    y=1;
    r1=random(255);
    g1=random(255);
    b1=random(255);
    if (h>=0) {
      h=h-d/4;
    } else {
      h=0;
    }
  }
}
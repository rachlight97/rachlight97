
void rects() { 
  if (h>=0) { 
    pushMatrix();
    color pix = color(r2, g2, b2);
    float ellR = map(brightness(pix), 0, 255, 5, 30);
    int x = int(random(ellR, sliderTicks2-ellR));
    int y = int(random(0, 600));
    fill(pix, 100);
    ellipse(x, y, 50, 50);
    popMatrix();
  }
}
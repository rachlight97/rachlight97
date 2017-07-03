void plant() {
  //种树
  pushMatrix(); 
  if (h>=480) {
    imageMode(CENTER);
    image(shu1, sliderTicks2/2, 560, 200, 200);
  } else if (h>=360&&h<480) {
    image(shu2, sliderTicks2/2, 510, 200, 200);
  } else if (h>=240&&h<360) {
    image(shu3, sliderTicks2/2, 490, 230, 230);
  } else if (h>=120&&h<240) {
    image(shu4, sliderTicks2/2, 470, 280, 280);
  } else if (h>0&&h<120) {
    image(shu5, sliderTicks2/2, 430, 390, 390);
  }
  popMatrix();
}
void setup() {
  size(400, 400);
}
void draw() {
  background(150);
  //noFill();
  noStroke();
 for (int i=0; i<=500; i+=50) {
    for (int x=0; x<=400; x+=40) {
      ellipse(i, 3*x/2, x/2, x/2);
      fill(5,20 , 80, 260-x);
    }
  }
  for (int i=0; i<=500; i+=50) {
    for (int x=0; x<=400; x+=40) {
      ellipse(i, 400-3*x/2, x/2, x/2);
      fill(5, 20, 80, 260-x);
    }
  }
  for (int i = 0; i <= 500; i+= 15)
  {
    stroke(255, 255, 255, i-200);
    noFill();
    strokeWeight(i/12);
    line(i, 0, i, height);
  }
  for (int i = 0; i <= 500; i+= 15)
  {
    stroke(255, 255, 255, i-200);
    noFill();
    strokeWeight(i/12);
    line(400-i, 0, 400-i, height);
  }
}
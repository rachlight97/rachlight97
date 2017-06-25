import Bit2AtomLibs.*;
Bit2AtomBouncingBall Ball;
float h[];


void setup() {
  size(600, 600);

  h=new float[100];
  for (int i=0; i<100; i++) {
    h[i]=random(50, height/2);
  }
  Ball = new Bit2AtomBouncingBall(width, height, 5, 7);
}


void draw() {
  background(0);

  fill(100, 150, 200);
  for (int i=0; i<100; i++) {
    rect(i*8, height/2, 8, h[i]);
    if (Ball.y<=300) {
      h[i]=h[i]+random(-4, 10);
    } else {
      h[i]=h[i]+random(-10, 4);
    }
  }

  fill(95);
  Ball.update();
  fill(255);
  stroke(mouseX/2, mouseY, mouseX);
  strokeWeight(5);
  ellipse(Ball.x, Ball.y, 40, 40);



  noStroke();
  fill(255);
  ellipse(300, 300, 300, 300);
  fill(250, 200, 100);
  pushMatrix();  
  translate(300, 300);
  float r = map(0, 90, 20, 100, 70);
  rotate(radians(frameCount));
  for (float i=0; i<12; i++) {
    ellipse(100, 100, Ball.x/10, Ball.y/10);
    fill(250, 200, 100);
    noStroke();
    rotate(radians(30));
  }
  popMatrix();



  fill(50, 100, 100);
  pushMatrix();  
  
  translate(mouseX, mouseY);

  rotate(radians(frameCount));
  for (float i=0; i<12; i++) {
    ellipse(40, 40, Ball.x/10, Ball.y/10);
    fill(50, 100, 100);
    noStroke();
    rotate(radians(30));
  }
  popMatrix();
}




void mousePressed() {
  PVector ball = new PVector(mouseX, mouseY);
  color cb = color(random(255), random(255), random(255));
}
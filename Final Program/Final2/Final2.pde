import controlP5.*;
import processing.serial.*;
Serial port;
ControlP5 cp5;
PFont font;
PImage photo, shu1, shu2, shu3, shu4, shu5, shu6, okay;
int sliderValue = 0;
int sliderTicks2 = 600;
int sliderTime = 5;
float d, r, m;
float y = 1;
float s = 0.8;
float h = 600;
float g = 0;
float r1, g1, b1 = 255;
float r2, g2, b2=0;
float pause = 1;
int i, message = 0;
int time;


void init() {
  r2=random(255);
  g2=random(255);
  b2=random(255);
}

void setup() {
  port = new Serial(this, "/dev/cu.usbmodem1411", 9600); 
  //定义myPort的端口和数据传输率  
  //应和Arduino保持一致  
  init();
  font=createFont("Letter Gothic Std", 100);
  size(1200, 650);
  smooth();
  background(255);
  photo= loadImage("cute.gif");
  shu1=loadImage("shu1.png");
  shu2=loadImage("shu2.png");
  shu3=loadImage("shu3.png");
  shu4=loadImage("shu4.png");
  shu5=loadImage("shu5.png");
  shu6=loadImage("shu6.png");
  okay=loadImage("okay.png");
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue")
    .setSize(200, 30)
    .setPosition(800, 370)
    .setRange(0, 255);
  cp5.addSlider("sliderTime")
    .setSize(200, 30)
    .setPosition(800, 420)
    .setRange(80, 2);
  cp5.addSlider("sliderTicks2")
    .setSize(200, 30)
    .setPosition(800, 470)
    .setRange(300, 600) 
    .setValue(600)
    .setNumberOfTickMarks(4)
    .setSliderMode(Slider.FLEXIBLE);
}

int data;

void draw() {

  while (port.available()>0) {
    char inByte=port.readChar();
    println(inByte);
    switch(inByte) {
    case'a':
      pause=1;
      break;
    case'b':
      pause=0;
      break;
    case'c':
      i=0;
      break;
    default:
      break;
    }
  }

  d=sliderTime;

  //标题
  headLine();

  //运动计划
  if (message==1) {
    fill(20);
    noStroke();
    rect(380, 6, 280, 650);
    imageMode(CENTER);
    image(okay, 520, 180, 180, 180);
    fill(255-sliderValue);
    textMode(CENTER);
    textSize(35);
    text("= Plan =", 520, 360);
    time = int(2.75/60*2400/d);
    text(time+"min", 520, 420);
    textSize(20);
    text("You have finished ", 520, 480);
    text(int(time*(600-h)/600)+" min", 520, 510);
  }


  if (pause ==1) {
    play();
  }
}

void play() {
  noStroke();
  fill(sliderValue, 25);
  rect(0, 0, width, height);

  if (h>0) { 
    rotates();
    ballFalling();
  } else {
    h=0;
  }

  if (h>0) {
    rects();//闪闪
  }

  if (h>0) {
    pushMatrix();
    //矩形上升
    if (y<=600) {
      rect(0, h, sliderTicks2/9, 600-h);
      fill(r2, g2, b2);
    }
    popMatrix();
  } else {
    fill(r2, g2, b2, 5);
    rect(0, 0, sliderTicks2, 600);
    fill(r2, g2, b2);
    ellipse(sliderTicks2/2, 150, 220, 220);
    imageMode(CENTER);
    image(shu6, sliderTicks2/2, 130, 200, 200);
    fill(255-sliderValue);
    imageMode(CENTER);
    image(photo, sliderTicks2/3, 465, 300, 300);
    textSize(30);
    text("You make it!", sliderTicks2*0.75, 450);
    textSize(20);
    text("Click 'r' to do it again! ", sliderTicks2/2, height/2-30);
    fill(r2, g2, b2);
    h=0;
  }

  plant();

  //底下和顶上的矩形
  pushMatrix(); 
  fill(255-sliderValue);
  rect(0, 0, sliderTicks2/9, 10);
  fill(sliderValue);
  textAlign(CENTER);
  textSize(9);
  text("FINISH", sliderTicks2/18, 8);
  fill(r1, g1, b1);
  rect(0, 600, sliderTicks2, 50);
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("= ENERGY BAR =", sliderTicks2/2, 630);
  popMatrix();
}

void keyReleased() {
  //P-停止
  if (key =='p' || key =='P') {
    if (pause==1) {
      pause=0;
    } else {
      pause=1;
    }
  } else if (key =='r' || key =='R') {
    h=600;
    i=i+1;
  } else if (key =='c' || key =='C') {
    init();
  } else if (key =='v' || key =='V') {
    if (message==0) {
      message=1;
    } else {
      message=0;
    }
  }
}
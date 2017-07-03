unsigned char state = 0;
void setup() {
  pinMode(13, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(3, INPUT);

  Serial.begin(9600);//定义数据传输率为9600比特
  attachInterrupt(1, blink, RISING);

}
void loop() {
  int c = digitalRead(7);

  if (c == HIGH) {
    Serial.write("c");
  }


  if (state != 0) {
    state = 0;
    Serial.write("a");
    digitalWrite(13, HIGH);
    delay(2000);

  }
  else {
    Serial.write("b");
    digitalWrite(13, LOW);
  }
}


void blink() {
  state++;
}

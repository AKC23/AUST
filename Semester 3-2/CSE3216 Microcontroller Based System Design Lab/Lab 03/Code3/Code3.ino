#include<Servo.h>
Servo servo;
int angle=10;
const int sigPin=9;
long duration;
int distance;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
servo.attach(8);
servo.write(angle);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  pinMode(sigPin,OUTPUT);
  digitalWrite(sigPin,LOW);
  delay(2);
  digitalWrite(sigPin,HIGH);
  delay(10);
  digitalWrite(sigPin,LOW);
  pinMode(sigPin,INPUT);
  duration=pulseIn(sigPin,HIGH);
  distance=(duration*0.034)/2;
  Serial.print("Distance(cm): ");

  if(distance>=0&&distance<=25)
  {
    servo.write(90);
    delay(1);
  }
  else if(distance>25&&distance<=50)
  {
    servo.write(-90);
    delay(1);
  }
  Serial.println(distance);
  delay(1000);
}

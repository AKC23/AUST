#include<Servo.h>

Servo servo;
int angle = 10;

const int sigPin = 9;
long duration;
int distance;

void setup() {

  servo.attach(8);
  servo.write(angle);
  Serial.begin(9600);

}

void serverMotorClock()
{
  for(angle = 10; angle < 90; angle++)
  {
    servo.write(angle);
    delay(15);
  }
}

void serverMotorAnti()
{
  for(angle = 90; angle > 10; angle-- )
  {
    servo.write(angle);
    delay(15);
  }
}

void loop() {
  pinMode(sigPin,OUTPUT);
  digitalWrite(sigPin,LOW);
  delay(2);

  digitalWrite(sigPin, HIGH);
  delay(10);
  digitalWrite(sigPin,LOW);
  pinMode(sigPin,INPUT);
  duration = pulseIn(sigPin,HIGH);
  distance = (duration * 0.034)/2;

  if(distance >=0 && distance <= 25)
  {
    serverMotorClock();
  }
  if(distance > 25 && distance <= 50)
  {
    serverMotorAnti();
  }
  
  Serial.print("Distance(cm): ");
  Serial.println(distance);
  delay(1000);
}

#include<Servo.h>
Servo servo;
int angle =0;
const int sigPin= 9; 
long duration;
int distance;

void setup() {
  // put your setup code here, to run once:
servo.attach(8);
Serial.begin(9600); 

}

void loop() {
  // put your main code here, to run repeatedly:
 
pinMode(sigPin,OUTPUT);
digitalWrite(sigPin, LOW); //clear trigger pin
delay(2);
digitalWrite(sigPin, HIGH);
delay(10);  // Set trigPin on HIGH state for 10 micro seconds
digitalWrite(sigPin, LOW);

pinMode(sigPin,INPUT); 
duration = pulseIn(sigPin, HIGH); // Reads the echoPin, returns the sound wave travel time in microseconds
distance= (duration*0.034)/2;
Serial.print("Distance(cm): ");
Serial.println(distance);
if(distance>50)
{
  if(angle!=120)
  {
    for(angle = 0; angle < 120; angle++)  
  {                                  
    servo.write(angle);               
    delay(15);                   
  }
  }
  
}
else if(distance<=50)
{
  if(angle!=90)
  {
      for(angle = 0; angle < 90; angle++)  
  {                                  
    servo.write(angle);               
    delay(15);                   
  }
  }

}
delay(1000);
}



#include <LedControl.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include "humiture_sensor.h"

#define INVALID_KEY ' '
#define LCD_TIMER_RENDER_LOOP 7272
#define LCD_TIMER_CLEAR 1
#define LCD_TIMER_PRINT 100
#define CAR_AUTO_SPEED 170

HumitureSensor *dht;  

int Left_front=3;                                 //motor directin pin
int Left_back=2;
int Right_front=5;
int Right_back=4;
int enA=6; 
int enB=7;

int Speed = 255; // 0 - 255.              //motor speed
int Speedsec=150;

int ir1=8;
int ir2=9;                                 //ir sensor
int ir3=34;
int ir4=36;

int DIN = 10;
int CS  = 11;                            //max7219 input
int CLK = 12;

byte love[8] = {0x78,0xfc,0x7e,0x3f,0x3f,0x7e,0xfc,0x78};
byte smile[8]= {0x3c,0x42,0xa9,0x85,0x85,0xa9,0x42,0x3c};                 //emojis code 
byte neutral[8]= {0x3c,0x42,0xa9,0x89,0x89,0xa9,0x42,0x3c};
byte sad[8] = {0x3c,0x42,0xa5,0x89,0x89,0xa5,0x42,0x3c};

LedControl lc = LedControl(DIN,CLK,CS,0);
LiquidCrystal_I2C lcd(0x27, 16, 2);

enum STATE { STAND, MOVE_CONTROL, MOVE_AUTO };
STATE CarState;
int CurrInput;
int LcdRenderTimer;                                                         //transition state 
int AutoDir;

void setup() {
  Serial.begin(9600);

  pinMode(enA,OUTPUT);
  pinMode(enB,OUTPUT);
  pinMode(Left_front,OUTPUT);
  pinMode(Left_back,OUTPUT);
  pinMode(Right_front,OUTPUT);
  pinMode(Right_back,OUTPUT);

  analogWrite(enA,Speed);
  analogWrite(enB,Speed);

  pinMode(ir1,INPUT);
  pinMode(ir2,INPUT);
  pinMode(ir3,INPUT);
  pinMode(ir4,INPUT);


  lc.shutdown(0,false);       //The MAX72XX is in power-saving mode on startup
  lc.setIntensity(0,15);      // Set the brightness to maximum value
  lc.clearDisplay(0); 

  lcd.begin();
  lcd.backlight();
  lcd.print("Measuring .....");

  Stop();    
  CarState = STAND;
  CurrInput = INVALID_KEY;

  dht = new HumitureSensor(30);
  dht->setup();

  LcdRenderTimer = 0;
  AutoDir = 1;
}

void forward(int _speed = Speed) {
  analogWrite(Left_front, _speed);
  analogWrite(Right_front, _speed);
}

void back(int _speed = Speed) {
  analogWrite(Left_back, _speed);
  analogWrite(Right_back, _speed);
}

void left() {
  analogWrite(Left_back,255);
  analogWrite(Right_front,255);
}

void right() {
  analogWrite(Left_front, 255);
  analogWrite(Right_back, 255);
}
void forwardleft() {
  analogWrite(Right_front, Speedsec);
  analogWrite(Left_front, Speed);
}
void forwardright() {
  analogWrite(Right_front, Speed);
  analogWrite(Left_front, Speedsec);
}
void backright() {
  analogWrite(Right_back, Speed);
  analogWrite(Left_back, Speedsec);
}

void backleft() {
  analogWrite(Right_back, Speedsec);
  analogWrite(Left_back, Speed);
}

void Stop() {
  analogWrite(Right_front, 0);
  analogWrite(Right_back, 0);
  analogWrite(Left_front, 0);
  analogWrite(Left_back, 0);
}

bool detect_collision_front() {
  int statusSensor = digitalRead(ir3);
  int statusSensor2 = digitalRead(ir4);
  return ((statusSensor == 0) || (statusSensor2 == 0));
}

bool detect_collision_back() {
  int statusSensor = digitalRead(ir1);
  int statusSensor2 = digitalRead(ir2);
  return ((statusSensor == 0) || (statusSensor2 == 0));
}

char get_input() {
  int cmd = Serial.read();

  char validKeys[] = {
    'F', 'B', 'L', 'R', 'G', 'I', 'H', 'J', 'q',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  };

  for (int i = 0; i < 19; ++i) {
    if (cmd == validKeys[i]) return cmd;
  }

  return INVALID_KEY;
}

void check_input() {
  if (Serial.available() > 0) {
    CurrInput = get_input();
  }
}

void exec_input() {
  switch (CurrInput) {
    case 'F': forward(); break;
    case 'B': back(); break;
    case 'L': left(); break;
    case 'R': right(); break;
    case 'G': forwardleft(); break;
    case 'I': forwardright(); break;
    case 'H': backleft(); break;
    case 'J': backright(); break;
    case '0': Speed = 100; break;
    case '1': Speed = 140; break;
    case '2': Speed = 153; break;
    case '3': Speed = 165; break;
    case '4': Speed = 178; break;
    case '5': Speed = 191; break;
    case '6': Speed = 204; break;
    case '7': Speed = 216; break;
    case '8': Speed = 229; break;
    case '9': Speed = 242; break;
    case 'q': Speed = 255; break;
    default: break;
  }
}

void printByte(byte character []) {
  for (int i = 0; i < 8; ++i) {
    lc.setRow(0, i, character[i]);
  }
}

void measure() {
  dht->loop();

  LcdRenderTimer += 1;
  if (LcdRenderTimer >= LCD_TIMER_RENDER_LOOP) {
    LcdRenderTimer = 0;
  }

  if (LcdRenderTimer == LCD_TIMER_CLEAR) {
    lcd.clear();
  } else if (LcdRenderTimer == LCD_TIMER_PRINT) {
    lcd.print("Humidity = ");
    lcd.print(dht->getHumidity());
    lcd.print(" %");

    lcd.setCursor(0,1);
    lcd.print("Temp = ");
    lcd.print(dht->getTemperature(false));
    lcd.print(" C");    
  }
}

void loop() {
  check_input();

  measure();
  
  switch (CarState) {
    case STAND:
      printByte(smile);
      if (detect_collision_back()) {
        AutoDir = 1;
        CarState = MOVE_AUTO;
        break;
      }
      if (detect_collision_front()) {
        AutoDir = -1;
        CarState = MOVE_AUTO;
        break;
      }
      if (CurrInput != INVALID_KEY) {
        CarState = MOVE_CONTROL;
        break;
      }
    break;
    case MOVE_CONTROL:
      printByte(neutral);
      exec_input();
      if (detect_collision_back()) {
        AutoDir = 1;
        CarState = MOVE_AUTO;
        break;
      }
      if (detect_collision_front()) {
        AutoDir = -1;
        CarState = MOVE_AUTO;
        break;
      }
      if (CurrInput == INVALID_KEY) {
        Stop();
        CarState = STAND;
        break;
      }
    break;
    case MOVE_AUTO:
      printByte(sad);
      bool stand = false;
      if (AutoDir == 1) {
        forward(CAR_AUTO_SPEED);
        if (!detect_collision_back()) stand = true;
      } else if (AutoDir == -1) {
        back(CAR_AUTO_SPEED);
        if (!detect_collision_front()) stand = true;
      }
      if (stand) {
        Stop();
        CarState = STAND;
        break;
      }
    break;
    default: break;
  }
}

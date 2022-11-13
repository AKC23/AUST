#include<Keypad.h>
#include<string.h>

const byte COLS=4; 
const byte ROWS=4;

int ans=0;
int num1;
int num2;
int state=0;
char temp=' ';
int buzzerPin=11;

char keys[ROWS][COLS]={
   {'1','2','3','+'},
   {'4','5','6','-'},
   {'7','8','9','*'},
   {'B','0','=','/'}
};

byte colPins[COLS]={6,7,8,9};
byte rowPins[ROWS]={2,3,4,5};

Keypad kd=Keypad(makeKeymap(keys),rowPins,colPins,ROWS,COLS);
 
void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600);
    pinMode(buzzerPin,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
   char key=kd.getKey();

if(key=='B' && state == 1)
{
  tone(buzzerPin,10);
  delay(500);
  noTone(buzzerPin);
  delay(500);
  state =0;
}
else{
    state =1;
}
    ans=0;
    if(key)
    {
      tone(buzzerPin,10);
      delay(50);
      noTone(buzzerPin);
      delay(50);
    
    // Serial.print(key);
    
           if(key=='+')
           {
               temp='+';
           }
           else if(key=='-')
           {
               temp='-';
           }
           else if(key=='*')
           {
               temp='*'; 
           }
           else if(key=='/')
           {
                temp='/';
           }
           else if(key=='=')
           {
               if(temp=='+') 
               {
                  ans=num1+num2;
               }
               else if(temp=='-') 
               {
                  ans=num1-num2;
               }
               else if(temp=='*') 
               {
                  ans=num1*num2;
               }
               else if(temp=='/') 
               {
                  ans=num1/num2;
               }
               
               Serial.print(String(ans));
               Serial.println();
               temp=' ';
           }
           else if(key!='+' || key!='-' || key!='*' || key!='/' || key!='=')
           {
               if(temp==' ')
               {
                num1=key-'0'; 
               }
               else if(temp!=' ')
               {
                num2=key-'0'; 
               }
           }
           //Serial.println("");    
   }
}

#include <Servo.h>
Servo myservo;

int value;
int servoValue;
int toneValue;
int duration = 500;


void setup()
{
  Serial.begin(9600);
  myservo.attach(12);
  pinMode( 13, OUTPUT);
}

void loop()

{

  value = analogRead(A0);
  servoValue = map(value, 1023, 0, 0, 180);     // 为了让转向跟电位器转法一致 1023-0
  myservo.write(servoValue);
  toneValue = map(value, 0, 1023, 50, 2000);

  if (toneValue >= 800 && toneValue <= 1500) {
    noTone(13);
  }
  else {
    delay(1000);
    tone(13, toneValue);
  }

  Serial.print(value);
  delay(100);

}






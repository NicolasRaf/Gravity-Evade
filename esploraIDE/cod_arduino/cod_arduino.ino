#include <Esplora.h>


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
    // put your main code here, to run repeatedly:
  int slider = Esplora.readSlider();
  int analogX = Esplora.readJoystickX();
  int analogY = Esplora.readJoystickY();
  int analogButton = Esplora.readJoystickSwitch();
  int powerButton = Esplora.readButton(SWITCH_4);
  int gravityRGB = map(slider, -1023, 1023, 255, 0);
//  powerButton = map(powerButton, 0, 1, 20, 30);
  slider = map(slider, 0, 1023, -1000, 1000);

    Esplora.writeRGB(gravityRGB,0,gravityRGB);

  Serial.print("sl");
  Serial.print(":");
  Serial.print(slider);
  
  Serial.print("#");
  
  Serial.print("anX");
  Serial.print(":");
  Serial.print(analogX);

  Serial.print("#");

  Serial.print("anY");
  Serial.print(":");
  Serial.print(analogY);

  Serial.print("#");

  Serial.print("anB");
  Serial.print(":");    
  Serial.print(analogButton);

  Serial.print("#");

  Serial.print("but");
  Serial.print(":");    
  Serial.print(powerButton);

   
  Serial.print("]");
  
  delay(10);
}

// mote.ino
// Program for Arduino version2
// Keio University Westlab 2016.10
// Author: Tada Matz

//<==== Please change according to an instruction
String MOTENAME = "MKWY"; //recommended to be between 1 ~ 10
int MOTEID = 1; //should be from 1 ~ 20
uint32_t DEST_ADDR_LSB = 0x40B0A324; // LSB of XBee Coordinator Address
//====>Please change according to an instruction

#include "XBee.h"
#include "source.h"

Servo myservo;
MyXBee myxbee;
int oldButtonState = 0;

long serialPreviousMillis = millis();

void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);

  pinMode(BUTTON_PIN, INPUT_PULLUP);

  myxbee.init();
}

void loop() { //loop
  //sending data
  if (clickDetection() == 1) {
    Serial.println(F("Button clicked"));
    char tempStr[1 + 1 + 1 + 1 + 5 + 1 + 5];
    sprintf(tempStr, "%c_%d_Click_%05d",
            UPLINK_HEADER,
            MOTEID,
            millis()/100
            );
    String temppayload = "";
    temppayload += tempStr + MOTENAME + "\n";
    myxbee.sendXBeeData(temppayload);
    Serial.print("temppayload: ");
    Serial.print(temppayload);
  }

  if (millis() - serialPreviousMillis > 1000) {  //loop seconds
    serialPreviousMillis += 1000;
    Serial.println(F("in a loop"));
  }
}

int clickDetection() { //click detection
  int buttonClicked = 0;
  int newButtonState = digitalRead(BUTTON_PIN);
  if (oldButtonState == HIGH && newButtonState == LOW) buttonClicked = 1; //button pressed. CAUTION pull up
  oldButtonState = newButtonState;
  return buttonClicked;
}

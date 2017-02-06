//baba nuki server
//need babaClient

import processing.serial.*;

Serial myPort;  // Create object from Serial class

int P_NUM = 4;

long pastMillis = millis();
boolean receiveFlag = false;
String lastStr = "no data";
String changeStr = "";
int receiveCnt = 0;

void setup() 
{
  size(800, 800);
  frameRate(120);
  surface.setResizable(true);

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  println(Serial.list());
}

void draw()
{
  if (receiveFlag && millis() - pastMillis> 1000) {
    receiveFlag = false;
  }

  //receive, judge serial connection
  if ( myPort.available() > 0) {  // If data is available,
    String str = myPort.readStringUntil('\n');
    if (str != null) {    
      println(str);
      receiveFlag = true;
      pastMillis = millis();
      lastStr = "last detected\n"
        + hour() + ":" + minute() + ":" + second();
      changeStr = "" + (int)random(1, P_NUM + 1) + " <=> " + (int)random(1, P_NUM+1);
      receiveCnt++;
    }
    myPort.clear();
  } else {                       // If the serial value is not 0,
  }

  //draw background
  if (receiveFlag) {
    fill(255);
    rect(0, 0, width, height);
  } else {
    fill(0);                 // set fill to light gray
    rect(0, 0, width, height);
  }

  //display
  if (!receiveFlag) {
    textSize(height/5);
    textAlign(CENTER, CENTER);
    fill(127);                
    text(changeStr, width/2, height/2);
  }
  
  //display
  textSize(height/10);
  textAlign(CENTER, CENTER);
  if (receiveFlag) {
    fill(0);
    text(year() + "/" + month() + "/" + day() + "\n"
      + "current time\n" + hour() + ":" + minute() + ":" + second() + "\n"
      + lastStr, 
      width/2, height/2);
  } else {
    fill(255);
    text(year() + "/" + month() + "/" + day() + "\n"
      + "current time\n" + hour() + ":" + minute() + ":" + second() + "\n"
      + lastStr, 
      width/2, height/2);
  }
  //number
  textAlign(RIGHT, BOTTOM);
  fill(127);
  text(receiveCnt, width, height);
}
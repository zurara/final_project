import processing.serial.*;


int zr;
Serial myPort;
PImage bg;


void setup() {
  myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  size(2560, 1600);
}

void draw() {
  if ( myPort.available() > 0) {
    // 读取从串口产过来的Sensor数值。
    zr = myPort.read()*2;  
    println(zr);

    //fill(255, 255, 255);     
    //rect(135, 80, 300, 150);

    if (zr<=110&&zr>=100) {
      background(50);
    }
    else if (zr>100) {
      background(200, 0, 0);
    }

    else if (zr<110) {
      background(0, 200, 0);
    }  
    textAlign(CENTER);
    text(zr, 650, 550);

    textSize(500);
  }
}
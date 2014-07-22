import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

boolean sketchFullScreen(){ return true; }


ArrayList <Square> squares; 
ArrayList <Circle> circles;
ArrayList <Forward> forwards;
ArrayList <Sideways> sidewayses;
String fShapee, xShapee;
String direction;
int colour;
int fSpeed, xSpeed;

boolean forwarding, sidewaysing;
boolean fPress, xPress;

void setup(){
 size(displayWidth, displayHeight, P3D);
  noCursor(); 
 
 fShapee = "box";
 xShapee = "box"; 
 direction = "right";
 colour = 0;
 fSpeed = 1;
 xSpeed = 1;
  
  //initialise the minim object
  minim = new Minim (this);
  in = minim.getLineIn(Minim.STEREO, 512);

  //initialise the FFT object
  fft = new FFT(in.bufferSize(), in.sampleRate());
  
  squares = new ArrayList <Square> (); //initialise square list
  circles = new ArrayList <Circle> (); //initialise circle list
  forwards = new ArrayList <Forward> (); //forward flying objects
  sidewayses = new ArrayList <Sideways> ();
  
}

void draw(){
  background(0);
  //println("fShape=" + fShapee +" speed="+speed+" forward(f)="+forwarding);
  
  fft.forward(in.mix);
  
  colour ++;
  if (colour > 100){
    colour = 0;
  }
  
  float vol=(fft.calcAvg(20,5000))*50;
  if (vol>50 && forwarding){
    //                Forward(int xIn,               int yIn,           int zIn, int speedIn, float colourIn, String shapIn){
    forwards.add (new Forward(int(random(0,width)), int(random(0,height)), -500, fSpeed, colour+random(0,50), fShapee));
  }
  
    if (vol>50 && sidewaysing){
      if (direction == "right"){
        sidewayses.add (new Sideways(-500, int(random(0,height)), xSpeed, colour+random(0,50), xShapee));
      }
    if (direction == "left"){
        sidewayses.add (new Sideways(int(width*1.3), int(random(0,height)), xSpeed, colour+random(0,50), xShapee));
      }
    if (direction == "down"){
        sidewayses.add (new Sideways(int(random(0,width)), -500, xSpeed, colour+random(0,50), xShapee));
      }
    if (direction == "up"){
        sidewayses.add (new Sideways(int(random(0,width)), int(height*1.3), xSpeed, colour+random(0,50), xShapee));
      }
   
  }
  
  for (int i = forwards.size()-1; i > 0; i--) {
    Forward myForward = (Forward) forwards.get(i);
  
    myForward.update();
    myForward.render();
    
    if (myForward.dead){
      forwards.remove(i);
    }
    
  }
  
  for (int i = sidewayses.size()-1; i > 0; i--) {
    Sideways mySideways = (Sideways) sidewayses.get(i);
  
    mySideways.update();
    mySideways.render();
    
    if (mySideways.dead){
      sidewayses.remove(i);
    }
    
  }
  
  
//  if (shapee == "rect"){
//    squares();
//  }
//    if (mode == 2){
//    circles();
//  }
  
  
}



void squares(){
  float vol=(fft.calcAvg(500,5000))*50;
  if (vol>50){
    // add a square x,y,colour
    squares.add (new Square(int(random(0,width)), int(random(0,height)), random(0,100)));
  }
  
  for (int i = 0; i < squares.size(); i++) {
    Square mySquare = (Square) squares.get(i);
  
    mySquare.update();
    mySquare.render();
    
  }
}

void circles(){
  float vol=(fft.calcAvg(500,5000))*50;
  if (vol>50){
    // add a square x,y,colour
    circles.add (new Circle(int(random(0,width)), int(random(0,height)), random(0,100)));
  }
  
  for (int i = 0; i < circles.size(); i++) {
    Circle myCircle = (Circle) circles.get(i);
  
    myCircle.update();
    myCircle.render();
    
  }
}




void keyPressed(){
  if (key == 'f') {
    fPress = true;
  }
  if (key == 'x') {
    xPress = true;
  }
  
  if (fPress){
    if (key == 'o') {
      forwarding = !forwarding;
    }
    if (key == 'b') {
      fShapee = "box";
    }
    if (key == 's') {
      fShapee = "sphere";
    }
    if (key == 'e') {
      fShapee = "ellipse";
    }
    if (key == 'r') {
      fShapee = "rect";
    }
    if (key == '0') {
      fSpeed = 0;
    }
    if (key == '1') {
      fSpeed = 1;
    }
    if (key == '2') {
      fSpeed = 2;
    }
    if (key == '3') {
      fSpeed = 3;
    }
    if (key == '4') {
      fSpeed = 4;
    }
    if (key == '5') {
      fSpeed = 5;
    }
    if (key == '6') {
      fSpeed = 6;
    }
    if (key == '7') {
      fSpeed = 7;
    }
    if (key == '8') {
      fSpeed = 8;
    }
    if (key == '9') {
      fSpeed = 9;
    }
  }
  
  
  
  if (xPress){
    if (key == 'o') {
      sidewaysing = !sidewaysing;
    }
    if (key == 'b') {
      xShapee = "box";
    }
    if (key == 's') {
      xShapee = "sphere";
    }
    if (key == 'e') {
      xShapee = "ellipse";
    }
    if (key == 'r') {
      xShapee = "rect";
    }
    if (key == '0') {
      xSpeed = 0;
    }
    if (key == '1') {
      xSpeed = 1;
    }
    if (key == '2') {
      xSpeed = 2;
    }
    if (key == '3') {
      xSpeed = 3;
    }
    if (key == '4') {
      xSpeed = 4;
    }
    if (key == '5') {
      xSpeed = 5;
    }
    if (key == '6') {
      xSpeed = 6;
    }
    if (key == '7') {
      xSpeed = 7;
    }
    if (key == '8') {
      xSpeed = 8;
    }
    if (key == '9') {
      xSpeed = 9;
    }
    if (keyCode == 37) {
      direction = "left";
    }
    if (keyCode == 38) {
      direction = "up";
    }
    if (keyCode == 39) {
      direction = "right";
    }
    if (keyCode == 40) {
      direction = "down";
    }
        
  }
   
}

void keyReleased(){
  if (key == 'f'){
    fPress = false;
  }
  if (key == 'x'){
    xPress = false;
  }
}

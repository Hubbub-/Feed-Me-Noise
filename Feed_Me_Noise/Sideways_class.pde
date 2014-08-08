class Sideways{
  float colour;
  int xPos, yPos, zPos, speed;
  //int timeMade, lifeTime;
  boolean dead;
  String shap;

  
  //constructor
  Sideways(int xIn, int yIn, int speedIn,  float colourIn, String shapIn){
    xPos = xIn;
    yPos = yIn;
    zPos = int(random(-500, 3000));
    colour = colourIn;
    shap = shapIn; 
    dead = false;
    speed = speedIn;
//    lifeTime = 50000;
//    timeMade = millis();
  }
  
  
  void render(){
    colorMode(HSB, 100, 100, 100);
    stroke(colour,50,50);
    noFill();
    pushMatrix();
    translate(xPos, yPos, zPos);
   
    if (shap == "rect"){
      rect(0,0,400,100);
    }
    if (shap == "ellipse"){
      ellipse(0,0,400,100);
    }
    if (shap == "box"){
      box(400,100,100);
    }
    if (shap == "sphere"){
      sphere(100);
    }
    popMatrix();
  }
  
  void update(){
    if (direction == "right"){
      xPos += speed;
       if (xPos > width * 1.5)
      dead = true;
    }
    if (direction == "left"){
      xPos -= speed;
       if (xPos < -width)
      dead = true;
    }
    if (direction == "down"){
      yPos += speed;
       if (yPos > height * 1.5)
      dead = true;
    }
    if (direction == "up"){
      yPos -= speed;
       if (yPos < -height)
      dead = true;
    }
  
  }
}

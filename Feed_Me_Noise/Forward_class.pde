class Forward{
  float colour;
  int xPos, yPos, zPos;
  int timeMade, lifeTime, speed;
  boolean dead;
  String shap;

  
  //constructor
  Forward(int xIn, int yIn, int zIn, int speedIn, float colourIn, String shapIn){
    xPos = xIn;
    yPos = yIn;
    zPos = zIn;
    colour = colourIn;
    shap = shapIn; 
    dead = false;
    lifeTime = 50000;
    timeMade = millis();
    speed = speedIn;
  }
  
  
  void render(){
    colorMode(HSB, 100, 100, 100);
    fill(colour,50,50);
    noStroke();
    pushMatrix();
    translate(xPos, yPos, zPos);
    
    if (shap == "rect"){
      rect(0,0,100,100);
    }
    if (shap == "ellipse"){
      ellipse(0,0,100,100);
    }
    if (shap == "box"){
      box(100,100,100);
    }
    if (shap == "sphere"){
      sphere(100);
    }
    popMatrix();
  }
  
  void update(){
    if (millis() > timeMade+lifeTime || zPos > 100){
      dead = true;
    }
    zPos += speed;
  
  }
}

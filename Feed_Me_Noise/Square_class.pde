class Square{
  float colour;
  int xPos, yPos;
  boolean dead;
  float timeMade, lifeTime;
  
  //constructor
  Square(int xIn, int yIn, float colourIn){
    xPos = xIn;
    yPos = yIn;
    colour = colourIn;
    timeMade = millis();
    lifeTime = 10000;
    dead = false;
  }
  
  
  void render(){
    colorMode(HSB, 100, 100, 100);
    fill(colour,50,50);
    noStroke();
    rect(xPos,yPos,100,100);
  }
  
  void update(){
    if (millis() > timeMade+lifeTime){
      dead = true;
    
  }
  }
}

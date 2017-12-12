
class Pacman extends Predator {
  //Variables du Pacman
  
  
  
  
  float upperLip, lowerLip;
  int hungry = 100;
  
  float upperLipClosed = PI / 180;
  float lowerLipClosed = TWO_PI - (PI / 180);
  float lowerLipOpen = 7 * QUARTER_PI;
  
  color normalColor = color (255, 238, 0);
  color huntingColor = color (255, 100, 0);
  color fillColor = normalColor;
  
  int currentframe = 0;

  int animationDelay = 500;
  int animationAcc = 0;
  
    
  float topSteer = 0.3;
  
  //boolean sleeping = false;
  //int sleepingAcc = 0;
  //int sleepingTime = 15000;
  
  Delay sleepingTime = new Delay (10000);
  Delay poopingTime = new Delay (5000);
  //Delay wanderingTime = new Delay (10000);
  Delay hungryTime = new Delay(15100);
  
  boolean debugMode = false;
  
  Pacman (PVector location, PVector size, World world) {
    super (world);
    this.location = location;
    this.size = size;
    
    velocity = new PVector (3, 3);
    
    preyingDistance = size.mag() * 5;
    
    target.x = random (width);
    target.y = random (height);
  }
  
  //Dessiner le pacman avec les animations
  void display()
  {
    pushMatrix();
    
    stroke(0);
    translate(location.x, location.y);
    
    state.display(this, deltaTime);
    state.modifyAngle(angle);
    fill(fillColor);
    arc(0, 0, size.x, size.y, upperLip, lowerLip, PIE);
    popMatrix();
    if (debugMode) {
      debug();
    }
  }
  
  void debug() {
    if (target != null) {
      stroke (#c40000);
      noFill();
      ellipse (target.x, target.y, 50, 50);
    }
  }
  
  void setTarget (float x, float y) {
    target.x = x;
    target.y = y;
  }
  
  void update(float deltaTime) {   
    animationAcc += deltaTime;
    
    if (animationAcc >= animationDelay) {
      animationAcc = 0;
      
      currentframe = state.setCurrentFrame(currentframe);
      
    }
    
    if(currentframe == 0) {
      upperLip = upperLipClosed;
      lowerLip = lowerLipClosed;
    } else {
      upperLip = QUARTER_PI;
      lowerLip = lowerLipOpen;  
    }
    /** END : ANIMATION BLOCK **/

  }

  void setPrey (int preyIndex) {
    prey = preys.get(preyIndex);
    setTarget (prey.location.x, prey.location.y);   
  }
  
  int seekPrey() {

    float minDistance = width * height;
   
    for (int i = 0; i < preys.size(); i++ ) {
      Mover current = preys.get(i);
      
      float distance = PVector.dist(current.location, location);
      
      if (distance < minDistance) {
        minDistance = distance;
        closestPrey = i;
      }      
    }
    
    if (preys.size() == 0) {
      closestPrey = -1;
    }
    
    return closestPrey;
  }
  
  boolean toggleHunting() {
    StateElement stateTemp = new Hunting();
    if (state.getCurrentState() != stateTemp.getCurrentState()) {
      state = new Hunting();
    } else {
      state = new Wandering();
    }
    
    return state.isInState(stateTemp.getCurrentState());
  }
  
  void setPreys(ArrayList<Boid> preys) {
    this.preys = preys;
  }
  
  void poop(float deltaTime) {
    
    if (!poopingTime.expired()){
      fillColor = color (200, 0, 0);
      poopingTime.update(deltaTime);
    } else {
      poops.add(new Food (location.x, location.y, this.world));
      state = new Wandering();
    }
  } 
}
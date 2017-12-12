class Hunting implements StateElement
{
  State currentState;
  Hunting(){
    currentState = State.HUNTING; 
  }
  
  State getCurrentState(){
    return currentState;
  }
  boolean isInState(State state){
    return currentState == state;
  }
  void transitionTo(State newState){
    currentState = newState;
  }
  void update(Boid b){
  }
  void display( Pacman p, float deltaTime){
      if (p.preys.size() == 0) {
      p.state = new Hunting();
      p.isChasing = false;
      //sleeping = true;
      p.preysEaten = 0;
      p.fillColor = p.normalColor;
      
      return;
    }
    p.fillColor = p.huntingColor;
    p.topSpeed = 3;
    if (!p.isChasing) {
      p.closestPrey = p.seekPrey();
      p.setPrey (p.closestPrey);
      p.isChasing = true;
    } else {
      p.target = p.prey.location;
      boolean captured = p.moveToTarget();
      
      if (captured) {
        p.preysEaten+=map (p.prey.getEnergy(), 0, 500, 1, 4);
        p.hungry = p.hungry + 5; 
        p.preys.remove(p.prey);
        p.isChasing = false;
        
      } else {
        if (p.prey.hasEscaped) {
          p.isChasing = false;
        }
      }
    }
      if (p.hungry >= 90) {
      p.state = new Sleeping();
      //isHunting = false;
      p.isChasing = false;
      //sleeping = true;
      p.preysEaten = 0;
      p.fillColor = p.normalColor;
    }
    if (p.hungryTime.expired()) {
      p.hungry--;
    }
  }  
  void display(ArrayList<Boid> boids, Boid b){
    
  }
    void update(Boid b, ArrayList<Predator> p){
  }
  void modifyAngle(float angle){
       rotate(angle);
  }
  int setCurrentFrame(int currentFrame){
   return ((currentFrame + 1) % 2);
  }
   color getColor(Boolean isMale){
    color col = isMale ? #0000AA : #AA00AA;
  return col; 
  }
}
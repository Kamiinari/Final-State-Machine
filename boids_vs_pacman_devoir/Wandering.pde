class Wandering implements StateElement
{
  State currentState;
  Wandering(){
    currentState = State.WANDERING; 
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
    p.topSpeed = 2;
    p.fillColor = p.normalColor;
    if (p.hungry > 40) {
      if (p.moveToTarget()) {
        p.setTarget(random (width - (2 * p.size.x)), random(height - (2* p.size.y)));
      }
      p.hungryTime.update(deltaTime);
    } else {
      p.state = new Hunting();
    }
    if (!p.hungryTime.expired()) {
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
    color col = isMale ? #0000FF : #FF00FF;
  return col; 
  }
}
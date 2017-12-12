class Sleeping implements StateElement
{
  State currentState;
  Sleeping(){
    currentState = State.SLEEPING; 
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
      if (!p.sleepingTime.expired()) {
      p.fillColor = color (200, 200, 200);
      p.sleepingTime.update(deltaTime);
    } else {
      p.state = new Pooping();
    }
    fill (50);
    text ("Zzzz...", p.size.x / 2, -p.size.y / 2);
    noFill();
    ellipse (p.size.x - 10, -p.size.y / 2 - 3, p.size.x, p.size.y / 2);
  } 
  void display(ArrayList<Boid> boids, Boid b){
    
  }
  void update(Boid b, ArrayList<Predator> p){
  }
  void modifyAngle(float angle){
  }
  int setCurrentFrame(int currentFrame){
    return 0;
  }
  color getColor(Boolean isMale){
    color col = isMale ? #0000FF : #FF00FF;
  return col; 
  }
}
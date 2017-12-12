class Escaping implements StateElement
{
  State currentState;
  Escaping(){
    currentState = State.WANDERING; 
  }
  
  Escaping(Boid b){
    PVector esc = escape(b,world.getPredators());
    if (esc != null) {
      esc.mult (b.escapeWeight);
      b.applyForce (esc);
    }   
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
    PVector esc = escape(b,world.getPredators());
    if (esc != null) {
      esc.mult (b.escapeWeight);
      b.applyForce (esc);
      b.state = new Escaping(b);
    }   
    else{
      b.state = new Flocking();
    }
  }
  void display(Pacman p, float deltaTime){
  } 
  void display(ArrayList<Boid> boids, Boid b){
    
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
  PVector escape (Boid b, ArrayList<Predator> preds) {
    PVector result = null;
    int count = 0;
    
    for (Predator p : preds) {
      float distanceToPredator = PVector.dist(b.location, p.location);
      
      if (distanceToPredator < b.escapeDistance) {
        if (result == null) {
          result = new PVector (0, 0);
        }
        result.add(PVector.sub(b.location, p.location));
        count++;
      }
    }
    
    if (result != null && count > 0) {
      result.div(count);
      //result.mult(-1);
      result.limit(b.topSpeed);
      
      b.state = new Escaping();
    }
    else{
     b.state = new Feeding();
    }
    return result;
  }
}
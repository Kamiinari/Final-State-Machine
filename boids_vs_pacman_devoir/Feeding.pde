class Feeding implements StateElement
{
  State currentState;
  Feeding(){
    currentState = State.FEEDING; 
  }
    
  Feeding(Boid b){
     PVector food = seekFood (b,world.foods);
    if (food != null) {
      if (!b.state.isInState(b.stateTempEscaping.getCurrentState())) {
        food.mult (b.feedingWeight);
        b.applyForce (food);  
      }          
    }  
    else{
      b.state = new Flocking();
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
  PVector food = seekFood (b,world.foods);
    if (food != null) {
      if (!b.state.isInState(b.stateTempEscaping.getCurrentState())) {
        food.mult (b.feedingWeight);
        b.applyForce (food);  
        b.state = new Feeding(b);
      }          
    }  
    else{
      b.state = new Flocking();
    }
  }
  void display( Pacman p, float deltaTime){
  } 
  void display(ArrayList<Boid> boids, Boid b){
     PVector result = null;
    
  }
  PVector seekFood (Boid b, ArrayList<Food> foods) {
    PVector result = null;
    
    for (int i = 0; i < foods.size(); i++) {
      Food f = foods.get (i);
      
      float distanceToFood = PVector.dist (b.location, f.location);
      
      if (distanceToFood < b.feedingRadius) {
        result = new PVector();
            
        result = PVector.sub (f.location, b.location);
        
        result.normalize();
        
        if (distanceToFood < f.size.x) {
          b.state = new Feeding();
          f.energy--;
          b.energy++;
          b.updateSize();
          //println (this.energy);
        } else {
          b.state  = new Hunting();
        }
        
        break;
      }
    }
    return result;
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
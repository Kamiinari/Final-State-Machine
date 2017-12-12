class Pooping implements StateElement
{
  State currentState;
  Pooping(){
    currentState = State.POOPING; 
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
  void update(){
  //a mettre code qui va rouler en boucle. 
  }
  void display( Pacman p, float deltaTime){
     if (!p.poopingTime.expired()){
      p.fillColor = color (200, 0, 0);
      p.poopingTime.update(deltaTime);
    } else {
      p.poops.add(new Food (p.location.x, p.location.y, p.world));
      p.state = new Wandering();
    }
  } 
  void display(ArrayList<Boid> boids, Boid b){
    
  }
  void update(Boid b){
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
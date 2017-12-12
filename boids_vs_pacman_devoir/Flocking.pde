class Flocking implements StateElement
{
  State currentState;
  Flocking(){
    currentState = State.FLOCKING; 
  }
  
  Flocking(Boid b, ArrayList<Boid> boids){
    PVector sep = b.separate(boids);
    PVector ali = b.align(boids);
    PVector coh = b.cohesion(boids);
    
    // Pondérer chacune des forces
    sep.mult (b.separationWeight);
    ali.mult (b.alignmentWeight);
    coh.mult (b.cohesionWeight);
    
    // Ajouter chacune des forces
    b.applyForce (sep);
    b.applyForce (ali);
    b.applyForce (coh);
    
    if (b.debug) {
      b.separation = sep;
      b.cohesion = coh;
      b.alignment = ali;
    }
    
      
    PVector esc = b.escape (b,world.getPredators());
    if (esc != null) {
      b.state = new Escaping(b);
    }
    
    PVector food = b.seekFood (b, world.foods);
    if (food != null) {
     if (!b.state.isInState(b.stateTempEscaping.getCurrentState())) { 
        b.state = new Feeding();
      }          
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
  void update(){
  //a mettre code qui va rouler en boucle. 
  }
  void display( Pacman p, float deltaTime){
  }
  void display(ArrayList<Boid> boids, Boid b){
    PVector sep = b.separate(boids);
    PVector ali = b.align(boids);
    PVector coh = b.cohesion(boids);
    
    // Pondérer chacune des forces
    sep.mult (b.separationWeight);
    ali.mult (b.alignmentWeight);
    coh.mult (b.cohesionWeight);
    
    // Ajouter chacune des forces
    b.applyForce (sep);
    b.applyForce (ali);
    b.applyForce (coh);
    
    if (b.debug) {
      b.separation = sep;
      b.cohesion = coh;
      b.alignment = ali;
    }
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
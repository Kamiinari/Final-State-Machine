import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;



interface StateElement{
  
  public enum State {
  WANDERING, 
  HUNTING, 
  SLEEPING, 
  POOPING, 
  ESCAPING, 
  MATING, 
  FEEDING, 
  RUT, 
  BROODING, 
  DYING,
  FLOCKING
  }

  void display(Pacman p, float deltaTime);
  void display(ArrayList <Boid> boids, Boid b);
  void modifyAngle(float angle);
  void update(Boid b);
  int setCurrentFrame(int currentFrame);
  State getCurrentState();
  boolean isInState(State state);
  color getColor(Boolean isMale);
 
  
  
  
  /*
  {
    currentState.executeFunction();
  }
  
  State getCurrentState(){
    return currentState;
  }
  
  boolean isInState(State state){
   return currentState == state;
  }

  void transitionTo(State newState) {
    currentState.exitFunction();
    currentState = newState;
    currentState.enterFunction();
  }*/
}
class Car {  
  //Bil - indeholder position & hastighed & "tegning"
  PVector pos = new PVector(60, 232);
  PVector vel = new PVector(0, 5);
  float fitness = 0;
  float lastangle;
  float currentangle;
  
  void turnCar(float turnAngle){
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  void calFitness(){
    PVector center = new PVector(width/2, height/2);
    PVector poscenter = PVector.sub(pos, center);
    //print(poscenter.heading());
  }
  
  void update() {
    calFitness();
    pos.add(vel);
  }
  
  float getFitness(){
    return fitness;
  }
  
}

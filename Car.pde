class Car {
  //Bil - indeholder position & hastighed & "tegning"
  PVector pos = new PVector(60, 232);
  PVector vel = new PVector(0, 5);
  PImage racecar;

  float fitness = 0;
  float lastangle;
  float currentangle;


  void turnCar(float turnAngle) {
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);

    //racecar = loadImage ("Racercar.png");
    //image(racecar, pos.x/2, pos.y/2);
  }


  void update() {
    pos.add(vel);
  }

}

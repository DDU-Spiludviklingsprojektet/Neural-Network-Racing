class CarController {
  //Forbinder - Sensorer & Hjerne & Bil
  float varians             = 2; //hvor stor er variansen på de tilfældige vægte og bias
  Car bil                    = new Car();
  NeuralNetwork hjerne       = new NeuralNetwork(varians);
  SensorSystem  sensorSystem = new SensorSystem();
  boolean       outOfBounds  = false;

  void update() {
    if (!outOfBounds && sensorSystem.whiteSensorFrameCount > 0) {
      outOfBounds = true;
    }

    if (!outOfBounds) {
      //1.)opdtarer bil
      bil.update();
      //2.)opdaterer sensorer
      sensorSystem.updateSensorsignals(bil.pos, bil.vel);
      //3.)hjernen beregner hvor meget der skal drejes
      float turnAngle = 0;
      float x1 = int(sensorSystem.leftSensorSignal);
      float x2 = int(sensorSystem.frontSensorSignal);
      float x3 = int(sensorSystem.rightSensorSignal);
      turnAngle = hjerne.getOutput(x1, x2, x3);
      //4.)bilen drejes
      bil.turnCar(turnAngle);
    }
  }

  void mutate() {
    hjerne.mutate();
  }

  void reset() {
    outOfBounds = false;
    bil.pos = new PVector(60, 232);

    sensorSystem.lapTimeInFrames = 0;
    sensorSystem.whiteSensorFrameCount = 0;
  }


  int getFitness() {
    if (outOfBounds) {
      return -100;
    } else {
      return int(sensorSystem.clockWiseRotationFrameCounter);
    }
  }

  void display() {
    bil.displayCar();
    sensorSystem.displaySensors();
  }
}

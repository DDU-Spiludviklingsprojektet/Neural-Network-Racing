//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 1000;
int       generations     = 10;

//CarSystem: Indholder en population af "controllere"
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn
PImage    trackImage;

void setup() {
  size(500, 500);

  trackImage = loadImage("track.png");
}

void draw() {
  background(255);
  fill(255);
  rect(0, 50, 1000, 1000);
  image(trackImage, 0, 80);
  textSize(50);
  fill(0, 0, 0);
  text("Framecount: "+ frameCount, 20, 40);
  fill(0, 0, 0);

  carSystem.updateAndDisplay();

  //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
  if (frameCount%50==0) {
    //println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
    for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
      SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
      if (s.whiteSensorFrameCount > 0) {
        carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
      } else if (s.clockWiseRotationFrameCounter < 0) {
        carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
      }
    }
  }
}

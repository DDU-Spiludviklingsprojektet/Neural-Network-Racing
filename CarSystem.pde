import java.util.*;

class CarSystem {
  int bestScore = 0;

  //CarSystem -
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();


  CarSystem(int populationSize) {
    for (int i=0; i<populationSize; i++) {
      CarController controller = new CarController();
      CarControllerList.add(controller);
    }
  }

  void newGeneration() {
    int bestScore = 0;
    Collections.sort(CarControllerList, new Comparator<CarController>() {
      int compare(CarController o1, CarController o2) {
        return o1.getFitness()-o2.getFitness();
      }
    }
    );
    bestScore = CarControllerList.get(CarControllerList.size()-1).getFitness();
    println(bestScore);
    for (int i=0; i<(populationSize/4)*3; i++) {
      CarControllerList.remove(0);
    }
    for (int i=0; i<(populationSize/4)*3; i++) {
      CarControllerList.add(new CarController());
    }
    for (int i=(populationSize/4)*3; i<(populationSize/4)*3; i++) {
      CarControllerList.get(i).mutate();
    }
    for (CarController controller : CarControllerList) {
      controller.reset();
    }
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner

    //Laver en ny gereration efter 1500 frames
    if (frameCount % 500 == 0) {
      newGeneration();
    }



    for (CarController controller : CarControllerList) {
      controller.update();
    }

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    for (CarController controller : CarControllerList) {
      controller.display();
    }
  }
}

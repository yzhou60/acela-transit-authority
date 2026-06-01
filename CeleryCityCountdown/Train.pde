class Train {
  private float currentX;
  private float currentY;
  private TransitLine route;
  private int targetIndex; //index of station in station arraylist
  private float progress; //0->1 % of completion from previous to next station; debugging
  private float speed = 0.02f; //I might do constant speed instead of 'constant time between each station' but ill see
  private int pauseTimer; //stop at station
  
  //variables for advanced features:
  private int trainColor;
  private int passengerCount;
  private int direction; //(1 = forward; -1 = backward; does not really matter which is forward vs back)
  
  public Train(TransitLine route) {
    this.route = route;
    Station start = route.getStops().get(0);
    this.currentX = start.getX();
    this.currentY = start.getY();
    this.targetIndex = 1; //starts at 1 (next station)
    this.progress = 0.0f;
    this.pauseTimer = 60; //1-sec pause before leaving origin
    
    //advanced features implmentation
    this.direction = 1; //forward
    this.trainColor = route.getLineColor();
  }
  
  //helpers
  public void handleDwellTime() {
  }
  
  public void reverseDirection() {
    direction *= -1; //reversal logic
    targetIndex += direction; //new next stop
  }

  //move & display
  public void move() {
    if (pauseTimer > 0) {
      pauseTimer--;
      return;
    }
    
    Station previous = route.getStops().get(targetIndex - direction);
    Station target = route.getStops().get(targetIndex);
    progress += speed; //0.02f; may change later

    //exact coords between 2 stations
    currentX = lerp(previous.getX(), target.getX(), progress);
    currentY = lerp(previous.getY(), target.getY(), progress);

    //if train arrived at station, its current coords are the exact station's to remove any accumulated floating rounding errors.
    if (progress >= 1.0f) {
      progress = 0.0f; 
      currentX = target.getX();
      currentY = target.getY();
      
      //advanced features: will not stop at isHidden stations for obvious reasons
      if (!target.getIsHidden()) {
        pauseTimer = 60; ///after arrival have pause of 60 frames at non-bends;
        
        //advanced features: passenger count
        int availableSpace = 50 - passengerCount; //max 50 pax per train
        int boarding = Math.min(target.getWaitingPassengers(), availableSpace);
        passengerCount += boarding;
        target.setWaitingPassengers(target.getWaitingPassengers() - boarding);
      }      
      
      //advanced-features: reversal logic at terminals
      if (targetIndex == route.getStops().size() - 1 && direction == 1) {
        passengerCount = 0;
        reverseDirection();
      }
      else if (targetIndex == 0 && direction == -1) {
        passengerCount = 0;
        reverseDirection();
      }
      else {
        targetIndex += direction;
      }
    }
  }

  public void display() {
    fill(trainColor); //now uses per-line colors intead of hardcoded red from earlier
    noStroke();
    
    //update: use circles instead to maximize fluidity
    circle(currentX, currentY, 25);
  }
}

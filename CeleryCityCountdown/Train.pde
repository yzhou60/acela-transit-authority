class Train {
  private float currentX;
  private float currentY;
  private TransitLine route;
  private int targetIndex; 
  private float progress; 
  private float speed = 0.02f; //incrementalization of 0.02 distance between each stop

  public Train(TransitLine route) {
    this.route = route;
    Station start = route.getStops().get(0);
    this.currentX = start.getX();
    this.currentY = start.getY();
    this.targetIndex = 1; 
    this.progress = 0.0f;
  }

  public void move() {
    //stops moving if it reaches the end of the line; preferably instaead stops at every stop; diagnosing
    if (targetIndex >= route.getStops().size()) {
      return; 
    }
    Station previous = route.getStops().get(targetIndex - 1);
    Station target = route.getStops().get(targetIndex);

    progress += speed;

    //exact coords between 2 stations
    currentX = lerp(previous.getX(), target.getX(), progress);
    currentY = lerp(previous.getY(), target.getY(), progress);

    //needs to figure out how to stop at station. To be debugged
    if (progress >= 1.0f) {
      progress = 0.0f; 
      targetIndex++; 
      
      currentX = target.getX();
      currentY = target.getY();
    }
  }

  public void display() {
    fill(255, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(currentX, currentY, 20, 10);
  }
}

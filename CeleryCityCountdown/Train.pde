class Train {
  private float currentX;
  private float currentY;
  private TransitLine route;
  //private boolean isFast; //maybe for implementation of local and exp trains
  
  public Train(TransitLine route, float startX, float startY) {
    this.route = route;
    this.currentX = startX;
    this.currentY = startY;
  }
  
  public void move() {
    //for later
    //Sample: float result = lerp(start, stop, amt); amount is the distance traveled (eg 0.1 means 10% of total distance_)

    currentX = lerp(currentX, currentX+5, 0.05);
    currentY = lerp(currentY, currentY+3, 0.05);
    fill(0, 150, 255);
    ellipse(currentX,currentY,50, 50);
  }
  
  public void display() {
    fill(255,0,0);
    noStroke(); //no need for trains to have outlines
    rectMode(CENTER);
    rect(currentX,currentY,20,10);
    
  }
}

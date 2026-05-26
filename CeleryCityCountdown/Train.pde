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
  }
  
  public void display() {
    fill(255,0,0);
    noStroke(); //no need for trains to have outlines
    rectMode(CENTER);
    rect(currentX,currentY,20,10);
    
  }
}

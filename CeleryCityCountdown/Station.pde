class Station {
  private int x;
  private int y;
  private boolean isTransfer; //is it an interchange; might not be needed: just set up 2 station dots, 1 for each line.
  //private boolean isLocal; //for later: isFast trains skip isLocal stations
  
  public Station(int x, int y, boolean isTransfer) {
    this.x = x;
    this.y = y;
    this.isTransfer = isTransfer;
  }
  
  //coordinate getters for later
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  //draw station
  public void display() {
    stroke(0);
    strokeWeight(3);
    if (isTransfer) {
      fill(255);
    }
    else {
      fill(0);
    }
    circle(x,y,15);
  }
}

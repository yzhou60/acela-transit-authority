class Station {
  private int x;
  private int y;
  private boolean isTransfer; //is it an interchange
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
  }
}

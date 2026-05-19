class Station {
  private int x;
  private int y;
  private boolean isTransfer; //is it an interchange
  
  public Station(in x, int y, boolean isTransfer) {
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
    

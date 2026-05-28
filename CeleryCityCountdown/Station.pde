class Station {
  private String name;
  private int x;
  private int y;
  private boolean isTransfer;
  
  //now the constructor requires a name
  public Station(String name, int x, int y, boolean isTransfer) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.isTransfer = isTransfer;
  }
  
  //getters
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  
  //the display, updated w/ code to add station name as appropriate
  public void display() {
    stroke(0); 
    strokeWeight(3);
    
    if (isTransfer) { fill(255); } 
    else { fill(0); }
    
    circle(x, y, 15); 

    //add station text name
    fill(0);
    textAlign(LEFT, BOTTOM);
    textSize(10);
    //offset off the station dot, appx
    text(name, x + 10, y - 10); 
  }
}

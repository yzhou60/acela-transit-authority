class TransitLine {
  private ArrayList<Station> stops;
  private int lineColor; //for now probably red, light blue, yellow, orange, and magenta. probably will implement magenta and yellow first.
  
  public TransitLine(int lineColor) {
    this.lineColor = lineColor;
    this.stops = new ArrayList<Station>();
  }
  
  //getters
  public ArrayList<Station> getStops() {
    return stops;
  }
  
  public int getLineColor() {
    return lineColor;
  }
  
  //drawLine,drawAllStations,drawStation
  public void drawLine() {
    if (stops.size() < 2) {
      return;
    }
    stroke(lineColor);
    strokeWeight(8);
    noFill();
    for (int i = 0; i<stops.size() - 1; i++) {
      Station current = stops.get(i);
      Station next = stops.get(i+1);
      line(current.getX(), current.getY(), next.getX(), next.getY());
    }
  }
  
  public void addStation(Station s) {
    stops.add(s);
  }
  
  public void drawAllStations() {
    for (Station s : stops) {
      s.generatePassengers(); //advanced-features
      s.display();
    }
  }
}

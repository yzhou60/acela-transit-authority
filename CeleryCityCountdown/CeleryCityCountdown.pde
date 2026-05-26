ArrayList<TransitLine> allLines;
ArrayList<Train> activeTrains;

void setup() {
  //canvas
  size(800, 600);
  
  allLines = new ArrayList<TransitLine>();
  activeTrains = new ArrayList<Train>();
  
  TransitLine magentaLine = new TransitLine(color(255, 0, 255)); //technically called Schonhauser Line; will update later if necessary
  //test station pairs
  Station s1 = new Station(100, 300, false);
  Station s2 = new Station(400, 300, true); //test Transfer station
  Station s3 = new Station(700, 300, false);
  magentaLine.addStation(s1);
  magentaLine.addStation(s2);
  magentaLine.addStation(s3);
  allLines.add(magentaLine); //maybe change to Schonahuser line later
}

void draw() {
  background(240);
  
  for (TransitLine theLine : allLines) {
    theLine.drawLine();
  }
  
  for (TransitLine theLine : allLines) {
    theLine.drawAllStations();
  }
}

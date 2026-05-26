ArrayList<TransitLine> allLines;
ArrayList<Train> activeTrains;

void setup() {
  //canvas
  size(800, 600);
  
  allLines = new ArrayList<TransitLine>();
  activeTrains = new ArrayList<Train>();
  
  //All the Lines
  TransitLine magentaLine = new TransitLine(color(255, 0, 255)); //technically called Schonhauser Line; will update later if necessary
  TransitLine yellowLine = new TransitLine(color(244, 228, 0));
  TransitLine lightBlueLine = new TransitLine(color(173, 216, 230));
  TransitLine orangeLine = new TransitLine(color(255, 165, 0));
  TransitLine pinkLine = new TransitLine(color(255, 192, 203));
  TransitLine greenLine = new TransitLine(color(34, 139, 34));
  
  //All the stations
  //Boardway is on y = 300; SAS is on x = 100
  Station celeryStalk = new Station(100, 300, true);
  Station patrumBoardway = new Station(300, 310, true);
  Station patrumHuge = new Station(300, 200, false);
  Station ferreLatus = new Station(350, 100, true);
  Station grandJunction = new Station(500, 300, true); //test Transfer station
  Station grandJunction2 = new Station(500, 310, true);
  Station metroParkEast = new Station(700, 300, true);
  Station metroParkEast2 = new Station(700, 310, true);
  Station latinDistrict = new Station(250, 200, true);
  Station Apt = new Station(250, 600, true);
  Station lebJCourt = new Station(100, 100, true);
  Station tuffPlaza = new Station(100, 500, true);

  
  //Train station assignments
  yellowLine.addStation(celeryStalk);
  yellowLine.addStation(grandJunction);
  yellowLine.addStation(metroParkEast);
  
  magentaLine.addStation(lebJCourt);
  magentaLine.addStation(celeryStalk);
  magentaLine.addStation(tuffPlaza);

  lightBlueLine.addStation(ferreLatus);
  lightBlueLine.addStation(patrumHuge);
  lightBlueLine.addStation(patrumBoardway);
  
  orangeLine.addStation(lebJCourt);
  orangeLine.addStation(latinDistrict);
  orangeLine.addStation(patrumBoardway);
  orangeLine.addStation(grandJunction2);
  orangeLine.addStation(metroParkEast2);
  
  //Central Dispatch
  allLines.add(yellowLine);
  allLines.add(magentaLine); //maybe change to Schonahuser line later
  allLines.add(lightBlueLine);
  allLines.add(orangeLine);
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

ArrayList<TransitLine> allLines;
ArrayList<Train> activeTrains;

void setup() {
  size(800, 600);
  
  allLines = new ArrayList<TransitLine>();
  activeTrains = new ArrayList<Train>();
  
  //transit lines
  TransitLine magentaLine = new TransitLine(color(255, 0, 255)); 
  TransitLine yellowLine = new TransitLine(color(244, 228, 0));
  TransitLine lightBlueLine = new TransitLine(color(173, 216, 230));
  TransitLine orangeLine = new TransitLine(color(255, 165, 0));
  TransitLine pinkLine = new TransitLine(color(255, 192, 203));
  
  //magenta line stations
  Station lebJCourt = new Station("Leb J. Court", 150, 150, true);
  Station celeryStalk = new Station("Celery Stalk", 150, 300, true);
  Station apateu = new Station("Apateu", 250, 350, true);
  Station grandJunction = new Station("Grand Junction", 450, 300, true);
  Station watersideCBD = new Station("Waterside-CBD", 650, 450, false);
  
  //yellow line stations
  Station cherryPark = new Station("Cherry Park", 50, 300, false);
  //celeryStalk is shared here
  //grandJunction is shared here
  Station metroParkEast = new Station("Metro Park East", 650, 305, true);
  
  //orange line stations
  //lebJCourt is shared here
  Station latinDistrict = new Station("Latin District", 250, 250, true); 
  Station patrumBoardway = new Station("Patrum Boardway", 350, 305, true);
  //Station grandJunction2 = new Station("Grand Junction", 450, 310, true);
  Station hospital = new Station("Hospital", 550, 310, false); //local mid-stop
  //Station metroParkEast2 = new Station("Metro Park East", 650, 310, true);
  
  //light blue line stations
  Station ferreLatus = new Station("Ferre Latus", 350, 150, false);
  Station hugeSt = new Station("Huge St", 350, 250, false);
  //patrumBoardway is shared here
  Station tuffPlazaE = new Station("Tuff Plaza E", 350, 450, false);
  
  //pink line stations
  Station richardian = new Station("Richardian", 250, 150, true);
  //latinDistrict is shared here
  //apateu is shared here
  Station tuffPlaza = new Station("Tuff Plaza", 250, 450, false);
  
  //magenta line assignments
  magentaLine.addStation(lebJCourt);
  magentaLine.addStation(celeryStalk);
  magentaLine.addStation(apateu);
  magentaLine.addStation(grandJunction);
  magentaLine.addStation(watersideCBD);
  
  //yellow line assignments
  yellowLine.addStation(cherryPark);
  yellowLine.addStation(celeryStalk);
  yellowLine.addStation(grandJunction);
  yellowLine.addStation(metroParkEast);
  
  //orange line assignments
  orangeLine.addStation(lebJCourt);
  orangeLine.addStation(latinDistrict);
  orangeLine.addStation(patrumBoardway);
  orangeLine.addStation(grandJunction);
  orangeLine.addStation(hospital);
  orangeLine.addStation(metroParkEast);
  
  //light blue line assignments
  lightBlueLine.addStation(ferreLatus);
  lightBlueLine.addStation(hugeSt);
  lightBlueLine.addStation(patrumBoardway);
  lightBlueLine.addStation(tuffPlazaE);
  
  //pink line assignments
  pinkLine.addStation(richardian);
  pinkLine.addStation(latinDistrict);
  pinkLine.addStation(apateu);
  pinkLine.addStation(tuffPlaza);
  
  //add lines to master list
  allLines.add(magentaLine);
  allLines.add(yellowLine); 
  allLines.add(orangeLine);
  allLines.add(lightBlueLine);
  allLines.add(pinkLine);
  
  //spawn test trains
  activeTrains.add(new Train(yellowLine));
  activeTrains.add(new Train(orangeLine));
  activeTrains.add(new Train(pinkLine));
}

void draw() {
  background(240);
  
  for (TransitLine theLine : allLines) {
    theLine.drawLine();
  }
  
  for (TransitLine theLine : allLines) {
    theLine.drawAllStations();
  }
  
  for (Train train : activeTrains) {
    train.move();
    train.display();
  }
}

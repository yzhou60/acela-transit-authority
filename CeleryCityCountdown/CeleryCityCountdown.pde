ArrayList<TransitLine> allLines;
ArrayList<Train> activeTrains;

//advanced-features: caps trains to prevent infinite spawning
int maxTrainsPerLine = 3;

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
  TransitLine greenLine = new TransitLine(color(34, 139, 34));
  
  //magenta line stations
  Station lebJCourt = new Station("Leb J. Court", 150, 150, true);
  Station celeryStalk = new Station("Celery Stalk", 150, 300, true);
  Station apateu = new Station("Apateu", 250, 350, true);
  Station grandJunction = new Station("Grand Junction", 450, 300, true);
  Station watersideCBD = new Station("Waterside-CBD", 600, 450, true);
  
  //yellow line stations
  Station cherryPark = new Station("Cherry Park", 50, 300, false);
  //celeryStalk is shared here
  //grandJunction is shared here
  Station metroParkEast = new Station("Metro Park East", 650, 305, true);
  
  //orange line stations
  //lebJCourt is shared here
  Station latinDistrict = new Station("Latin District", 250, 250, true); 
  Station patrumBoardway = new Station("Daniel-Berkovich", 350, 305, true);
  //Station grandJunction2 = new Station("Grand Junction", 450, 310, true);
  Station hospital = new Station("Hospital", 550, 310, false); //local mid-stop
  //Station metroParkEast2 = new Station("Metro Park East", 650, 310, true);
  
  //light blue line stations
  Station ferreLatus = new Station("Ferre-Latus St", 350, 150, false);
  Station hugeSt = new Station("Huge St", 350, 200, false);
  //patrumBoardway is shared here
  Station tuffPlazaEast = new Station("Tuff Plaza East", 350, 450, true);
  
  //pink line stations
  Station richardian = new Station("Richardian", 250, 150, true);
  //latinDistrict is shared here
  //apateu is shared here
  Station tuffPlaza = new Station("Tuff Plaza", 150, 450, true);
  
  //green line shares stations with every other line
  
  //advanced-features: bends
  Station magentaBend1 = new Station(true, "Hidden", 200, 350);
  Station yellowBend2 = new Station(true, "Hidden", 350, 250);
  Station sharedBend1 = new Station(true, "Hidden", 200, 250);
  Station magentaBend2 = new Station(true, "Hidden", 350, 350);
  Station magentaBend3 = new Station(true, "Hidden", 500, 350);
  Station magentaBend4 = new Station(true, "Hidden", 500, 450);
  Station pinkBend1 = new Station(true, "Hidden", 250, 400);
  Station greenBend1 = new Station(true, "Hidden", 650, 450);
  
  
  //magenta line assignments
  magentaLine.addStation(lebJCourt);
  magentaLine.addStation(celeryStalk);
  magentaLine.addStation(magentaBend1); //advanced features
  magentaLine.addStation(apateu);
  magentaLine.addStation(magentaBend2); //advanced features
  magentaLine.addStation(grandJunction);
  magentaLine.addStation(magentaBend3); //advanced features
  magentaLine.addStation(magentaBend4); //advanced-features
  magentaLine.addStation(watersideCBD);
  
  //yellow line assignments
  yellowLine.addStation(cherryPark);
  yellowLine.addStation(celeryStalk);
  yellowLine.addStation(sharedBend1); //advanced features
  yellowLine.addStation(latinDistrict);
  yellowLine.addStation(yellowBend2); //advanced features
  yellowLine.addStation(grandJunction);
  yellowLine.addStation(metroParkEast);
  
  //orange line assignments
  orangeLine.addStation(lebJCourt);
  orangeLine.addStation(sharedBend1); //advanced-features
  orangeLine.addStation(latinDistrict);
  orangeLine.addStation(patrumBoardway);
  orangeLine.addStation(grandJunction);
  orangeLine.addStation(hospital);
  orangeLine.addStation(metroParkEast);
  
  //light blue line assignments
  lightBlueLine.addStation(ferreLatus);
  lightBlueLine.addStation(hugeSt);
  lightBlueLine.addStation(patrumBoardway);
  lightBlueLine.addStation(tuffPlazaEast);
  
  //pink line assignments
  pinkLine.addStation(richardian);
  pinkLine.addStation(latinDistrict);
  pinkLine.addStation(apateu);
  pinkLine.addStation(pinkBend1); //advanced-features
  pinkLine.addStation(tuffPlaza);
  
  //green line assignments
  greenLine.addStation(metroParkEast);
  greenLine.addStation(greenBend1); //advanced-features
  greenLine.addStation(watersideCBD);
  greenLine.addStation(tuffPlazaEast);
  greenLine.addStation(tuffPlaza);
  
  //add lines to master list
  allLines.add(magentaLine);
  allLines.add(yellowLine); 
  allLines.add(orangeLine);
  allLines.add(lightBlueLine);
  allLines.add(pinkLine);
  allLines.add(greenLine);
  
  //spawn initial trains
  for (TransitLine theLine : allLines) {
    activeTrains.add(new Train(theLine));
  }
}

void draw() {
  background(240);
  
  //Acela Transit Authority Continuous Frequency Metrorail (TM); new train every 3 seconds better than nyc!
  if (frameCount % 180 == 0 && activeTrains.size() < (maxTrainsPerLine * allLines.size())) { //180f = 3sec
    for (TransitLine theLine : allLines) {
      activeTrains.add(new Train(theLine));
    }
  }
  //proper layering so station is the top layer; train is middle; and lines are the bottommost.
  for (TransitLine theLine : allLines) {
    theLine.drawLine();
  }
  
  for (Train train : activeTrains) {
    train.move();
    train.display();
  }
  
  for (TransitLine theLine : allLines) {
    theLine.drawAllStations();
  }

}

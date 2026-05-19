ArrayList<TransitLine> allLines;
ArrayList<Train> activeTrains;

void setup() {
  //canvas
  size(800, 600);
  
  allLines = new ArrayList<TransitLine>();
  activeTrains = new ArrayList<Train>();
  
  //eventually: instantiate Stations and TransitLines
}

void draw() {
  background(240);
  
  //Loop through all the lines & draw the lines;
  //Then loop thru all the lines to draw the stations
  //Finally loop through all active trains and call move and display
  //hopefully this works
}

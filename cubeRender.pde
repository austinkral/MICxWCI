 // Declare MIC and MIC + WCI stimuli
int cubeRad = 80;
int weight = 2;
CubeWCI CubeWCI1;
WingsWCI WingsWCI;
FringeWCI FringeWCI1;
PImage img;

// Initialize MIC and MIC + WCI stimuli
void setup() {
  // Sized for lab monitor
  size(800,600,P3D);
  float[] pos = {width * 0.5, height * 0.32, -250};
  strokeWeight(weight);
  noFill();
  ortho();
  CubeWCI1 = new CubeWCI(pos, cubeRad, weight, 4, 1, true);
  WingsWCI = new WingsWCI(pos, cubeRad, weight, true);
  FringeWCI1 = new FringeWCI(pos, cubeRad, weight, 4, 1, true, "floatingFringeBlue");
  img = loadImage("scale/scale.png");
} // setup

// Display MIC and MIC + WCI stimuli
void draw() {
  background(255);
  imageMode(CENTER);
  image(img, width / 2, height - 90, img.width, img.height);
  // Cube1.display();
  pushMatrix();
  CubeWCI1.display();
  popMatrix();
  // pushMatrix();
  // WingsWCI.display();
  // popMatrix();
  pushMatrix();
  FringeWCI1.display();
  popMatrix();
  // saveFrame("rated/overhangDoubleCorner4/###.png");
} // draw

// Exit display
void keyPressed() {
  if (key == ' ') {
    exit();
  } // if
} // keyPressed

// Declare MIC and MIC + WCI stimuli
int cubeRad = 80;
int weight = 2;
Cube Cube1;
CubeWCI CubeWCI1;
PImage img;

// Initialize MIC and MIC + WCI stimuli
void setup() {
  // Sized for lab monitor
  // size(800, 600, P3D);
  fullScreen(P3D);
  noFill();
  stroke(weight);
  strokeJoin(MITER);
  ortho();
  Cube1 = new Cube(width * 0.5, height * 0.32, -250, cubeRad, weight, 4, true);
  CubeWCI1 = new CubeWCI(width * 0.5, height * 0.32, -250, cubeRad, weight, 4, true, "overhangLargeGap");
  img = loadImage("scale/scale.png");
} // setup

// Display MIC and MIC + WCI stimuli
void draw() {
  background(255);
  // imageMode(CENTER);
  // image(img, width / 2, height - 90, img.width, img.height);
  Cube1.display();
  CubeWCI1.display();
  // saveFrame("rated/floatingFringe4/###.png");
} // draw

// Exit display
void keyPressed() {
  if (key == ' ') {
    exit();
  } // if
} // keyPressed

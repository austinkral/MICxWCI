// Declare MIC and MIC + WCI stimuli
int cubeRad = 80;
int weight = cubeRad / 12;
Cube Cube1;
CubeWCI CubeWCI1;
Cube Cube2;
CubeWCI CubeWCI2;

// Initialize MIC and MIC + WCI stimuli
void setup() {
  fullScreen(P3D);
  strokeJoin(MITER);
  noFill();
  ortho();
  Cube1 = new Cube(width * 0.35, height * 0.25, -250, cubeRad, 2, true);
  CubeWCI1 = new CubeWCI(width * 0.65, height * 0.25, -250, cubeRad, 2, true, "plain");
  Cube2 = new Cube(width * 0.35, height * 0.75, -250, cubeRad, 6, true);
  CubeWCI2 = new CubeWCI(width * 0.65, height * 0.75, -250, cubeRad, 6, true, "plain");
} // setup

// Display MIC and MIC + WCI stimuli
void draw() {
  background(255);
  Cube1.display();
  CubeWCI1.display();
  Cube2.display();
  CubeWCI2.display();
  // saveFrame("renderTwoEdges/cubeRender####.png");
} // draw

// Exit display
void keyPressed() {
  if (key == ' ') {
    exit();
  } // if
} // keyPressed

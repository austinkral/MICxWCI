// Declare MIC and MIC + WCI stimuli
int cubeRad = 65;
int weight = cubeRad / 12;
Cube Cube1;
CubeWCI CubeWCI1;
Cube Cube2;
CubeWCI CubeWCI2;

// Initialize MIC and MIC + WCI stimuli
void setup() {
  // fullScreen(P3D);
  size(800, 600, P3D);
  strokeCap(ROUND);
  noFill();
  ortho();
  Cube1 = new Cube(width * 0.3, height * 0.5, -250, cubeRad, 6, "rotate");
  CubeWCI1 = new CubeWCI(width * 0.7, height * 0.5, -250, cubeRad, 6, "rotate", "plain");
  // Cube2 = new Cube(width * 0.3, height * 0.50, -250, 150, 6, true);
  // CubeWCI2 = new CubeWCI(width * 0.7, height * 0.50, -250, 150, 6, true, "plain");
} // setup

// Display MIC and MIC + WCI stimuli
void draw() {
  background(255);
  Cube1.display();
  CubeWCI1.display();
  // Cube2.display();
  // CubeWCI2.display();
  // saveFrame("renderOverhangGap/cubeRender####.png");
} // draw

// Exit display
void keyPressed() {
  if (key == ' ') {
    exit();
  } // if
} // keyPressed

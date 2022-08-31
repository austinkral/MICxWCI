// Declare MIC and MIC + WCI stimuli
int cubeRad = 65;
int weight = cubeRad / 12;
Cube Cube1;
CubeWCI CubeWCI1;
PImage img;

// Initialize MIC and MIC + WCI stimuli
void setup() {
  // Sized for lab monitor
  size(800, 600, P3D);
  strokeCap(ROUND);
  noFill();
  ortho();
  Cube1 = new Cube(width * 0.3, height * 0.32, -250, cubeRad, 6, "rotate");
  CubeWCI1 = new CubeWCI(width * 0.7, height * 0.32, -250, cubeRad, 6, "rotate", "plain");
  img = loadImage("scale/scale.png");
} // setup

// Display MIC and MIC + WCI stimuli
void draw() {
  background(255);
  textAlign(CENTER);
  textSize(24);
  fill(#000000);
  text("Please rate the right hand stimulus above on the following scale:", width * 0.5, height * 0.7);
  text("1 - 7", width * 0.5, height * 0.85);
  noFill();
  imageMode(CENTER);
  image(img, width * 0.5, height * 0.85, img.width, img.height);
  Cube1.display();
  CubeWCI1.display();
} // draw

// Exit display
void keyPressed() {
  if (key == ' ') {
    exit();
  } // if
} // keyPressed

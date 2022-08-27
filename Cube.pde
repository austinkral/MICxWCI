class Cube {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, sides, weight, rotDir;
  String rotate;
  
  // Cube constructor
  Cube(float x, float y, float z, int r, int s, String rot) {
    xPos = x;
    yPos = y;
    zPos = z;
    cubeRad = r;
    sides = s;
    rotate = rot;
    rotAngle = 0;
    rotDir = 1;
    weight = cubeRad / 12;
  } // Cube
  
  // Draw Cube object to screen
  void display() {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(weight);
    stroke(191, 85, 255);
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    if (rotate == "rotate") this.rotate();
    else if (rotate == "twist");
    if (this.sides == 6) {
      beginShape();
      vertex(cubeRad, cubeRad, -cubeRad);
      vertex(cubeRad, cubeRad, cubeRad);
      vertex(-cubeRad, cubeRad, cubeRad);
      vertex(-cubeRad, -cubeRad, cubeRad);
      vertex(cubeRad, -cubeRad, cubeRad);
      vertex(cubeRad, -cubeRad, -cubeRad);
      vertex(cubeRad, cubeRad, -cubeRad);
      vertex(cubeRad, cubeRad, cubeRad);
      endShape();
    } else if (this.sides == 4) {
      beginShape();
      vertex(cubeRad, cubeRad, -cubeRad);
      vertex(cubeRad, cubeRad, cubeRad);
      vertex(-cubeRad, cubeRad, cubeRad);
      endShape();
      beginShape();
      vertex(cubeRad, -cubeRad, -cubeRad);
      vertex(cubeRad, -cubeRad, cubeRad);
      vertex(-cubeRad, -cubeRad, cubeRad);
      endShape();
    } else if (this.sides == 2) {
      stroke(191, 85, 255);
      line(cubeRad, cubeRad, cubeRad, -cubeRad, cubeRad, cubeRad);
      line(cubeRad, -cubeRad, -cubeRad, cubeRad, -cubeRad, cubeRad);
    } // if
    popMatrix();
  } // display
  
  // Rotates CubeWCI objects 46 degrees back and forth
  // on the xy-plane between -22 and -68 degrees
  void rotate() {
    rotateY(rotAngle);
    if (abs(rotAngle) >= 0.4) {
      rotDir = -rotDir; 
    } // if
    if (rotDir == 1) {
      rotAngle += 0.017;
    } else if (rotDir == -1) {
      rotAngle -= 0.017;
    } // if
  } // rotate
  
} // Cube

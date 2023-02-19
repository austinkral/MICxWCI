class WingsWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, weight, rotDir;
  boolean rotate;
  int purple = #A550E2, orange = #FFCF25, blue = #24D1FF;
  
  public WingsWCI(float[] pos, int r, int w, boolean rot) {
    xPos = pos[0];
    yPos = pos[1];
    zPos = pos[2];
    cubeRad = r;
    rotate = rot;
    rotAngle = 0;
    rotDir = -1;
    weight = w;
  } // WingsWCI
  
  public void display() {
    // Position cube
    translate(xPos, yPos, zPos);
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    
    if (this.rotate == true) this.rotate();
    
    stroke(orange);
    line(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
    line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, cubeRad - weight, cubeRad);
    line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
    line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, -cubeRad + weight, cubeRad);
  } // display
  
    // Rotates CubeWCI objects 46 degrees back and forth
  // on the xy-plane between -25 and -65 degrees
  private void rotate() {
    rotateY(rotAngle);
    if (abs(rotAngle) >= 0.4) {
      rotDir = -rotDir;
    } // if
    if (rotDir == 1) {
      rotAngle += 0.015;
    } else if (rotDir == -1) {
      rotAngle -= 0.015;
    } // if
  } // rotate
  
} // WingsWCI

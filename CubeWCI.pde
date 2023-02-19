class CubeWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, weight, sides, rotDir;
  boolean rotate;
  String type;
  int purple = #A550E2, orange = #FFCF25, blue = #24D1FF;
  
  // Initialize cube edges
  float[][] edges;

  /* 
   |----------------------------------------------------
   | CubeWCI constructor
   |----------------------------------------------------
   |  - Position at (pos[0], pos[1], pos[2]) on screen
   |  - Length of cube edge = r 
   |  - Weight of lines = w
   |  - Number of sides = s
   |  - Direction of rotation = dir
   |  - Rotating vs still = rot
   |----------------------------------------------------
   */
  public CubeWCI(float[] pos, int r, int w, int s, int dir, boolean rot) {
    xPos = pos[0];
    yPos = pos[1];
    zPos = pos[2];
    cubeRad = r;
    sides = s;
    rotate = rot;
    rotAngle = 0;
    rotDir = dir;
    weight = w;
    
    // Declare cube edges
    edges = new float[][] {
      {-cubeRad, -cubeRad, cubeRad}, // top left vertex
      {cubeRad, -cubeRad, cubeRad}, // top front vertex
      {cubeRad, -cubeRad, -cubeRad}, // top right vertex
      {cubeRad, cubeRad, -cubeRad}, // bottom right vertex
      {cubeRad, cubeRad, cubeRad}, // bottom front vertex
      {-cubeRad, cubeRad, cubeRad} // bottom left vertex
    };
    
  } // CubeWCI

  // Draw CubeWCI object to screen at (xPos, yPos, zPos)
  // with initial orientation (-20, -45)
  public void display() {
    // Position cube
    translate(xPos, yPos, zPos);
    rotateX(radians(-20)); // re-align
    rotateY(radians(-45)); // cube
  
    if (this.rotate == true) this.rotate();
    
    if (this.sides == 6) {
      // Border
      beginShape();
      stroke(purple);
      for (int i = 0; i < edges.length; i++)
        vertex(edges[i][0], edges[i][1], edges[i][2]);
      endShape(CLOSE);
    } else if (this.sides == 4) {
      // Border top
      beginShape();
      stroke(purple);
      for (int i = 0; i < edges.length / 2; i++)
        vertex(edges[i][0], edges[i][1], edges[i][2]);
      endShape();
      // Border bottom
      beginShape();
      stroke(purple);
      for (int i = 3; i < edges.length; i++)
        vertex(edges[i][0], edges[i][1], edges[i][2]);
      endShape();
    } // if
    
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
  
} // CubeWCI

class Cube {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, sides, weight, rotDir;
  boolean rotate;
  int purple = #A550E2, orange = #FFCF25;
  float[][] border;
  
  // Initialize cube edges
  PShape top = createShape();
  PShape bottom = createShape();
  
  // Cube constructor
  Cube(float x, float y, float z, int r, int w, int s, boolean rot) {
    xPos = x;
    yPos = y;
    zPos = z;
    cubeRad = r;
    sides = s;
    rotate = rot;
    rotAngle = 0;
    rotDir = 1;
    weight = w;
    
    // Define cube vertices
    border = new float[][] {
      {-cubeRad, -cubeRad, cubeRad}, // top left vertex
      {cubeRad, -cubeRad, cubeRad}, // top front vertex
      {cubeRad, -cubeRad, -cubeRad}, // top right vertex
      {cubeRad, cubeRad, -cubeRad}, // bottom right vertex
      {cubeRad, cubeRad, cubeRad}, // bottom front vertex
      {-cubeRad, cubeRad, cubeRad}, // bottom left vertex
    };
  } // Cube
  
  // Draw Cube object to screen
  void display() {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(weight);
    stroke(purple);
    rotateX(radians(-20)); // re-align
    rotateY(radians(-45)); // cube
    

    if (this.rotate == true) this.rotate();
    if (this.sides == 6) {
      top.beginShape();
      stroke(purple);
      for (int i = 0; i < border.length; i++)
        top.vertex(border[i][0], border[i][1], border[i][2]);
      top.endShape(CLOSE);
    } else if (this.sides == 4) {
        top.beginShape();
        stroke(purple);
        for (int i = 0; i < border.length / 2; i++)
          top.vertex(border[i][0], border[i][1], border[i][2]);
        top.endShape();
      bottom.beginShape();
      stroke(purple);
      for (int i = 3; i < border.length; i++)
        bottom.vertex(border[i][0], border[i][1], border[i][2]);
      bottom.endShape();
    } else if (this.sides == 2) {
      top.beginShape(LINES);
      stroke(purple);
      for (int i = 1; i < border.length / 2; i++)
        top.vertex(border[i][0], border[i][1], border[i][2]);
      top.endShape();
      bottom.beginShape(LINES);
      stroke(purple);
      for (int i = 4; i < border.length; i++)
        bottom.vertex(border[i][0], border[i][1], border[i][2]);
      bottom.endShape();
    } // if
    if (top != null) shape(top);
    if (bottom != null) shape(bottom);
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
      rotAngle += 0.015;
    } else if (rotDir == -1) {
      rotAngle -= 0.015;
    } // if
  } // rotate
  
} // Cube

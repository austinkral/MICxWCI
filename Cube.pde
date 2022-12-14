class Cube {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, sides, weight, rotDir;
  String rotate;
  // int purple = #000000, orange = #000000;
  int purple = #A550E2, orange = #FFCF25;
  float[][] border;
  
  // Cube constructor
  Cube(float x, float y, float z, int r, int w, int s, String rot) {
    xPos = x;
    yPos = y;
    zPos = z;
    cubeRad = r;
    sides = s;
    rotate = rot;
    rotAngle = 0;
    rotDir = 1;
    weight = w;
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
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    PShape p = createShape();
    PShape q = createShape();
    if (rotate == "rotate") this.rotate();
    if (this.sides == 6) {
      p.beginShape();
      stroke(purple);
      for (int i = 0; i < border.length; i++)
        p.vertex(border[i][0], border[i][1], border[i][2]);
      p.endShape(CLOSE);
    } else if (this.sides == 4) {
      p.beginShape();
      stroke(purple);
      for (int i = 0; i < border.length / 2; i++)
        p.vertex(border[i][0], border[i][1], border[i][2]);
      p.endShape();
      q.beginShape();
      stroke(purple);
      for (int i = 3; i < border.length; i++)
        q.vertex(border[i][0], border[i][1], border[i][2]);
      q.endShape();
    } else if (this.sides == 2) {
      p.beginShape(LINES);
      stroke(purple);
      for (int i = 1; i < border.length / 2; i++)
        p.vertex(border[i][0], border[i][1], border[i][2]);
      p.endShape();
      q.beginShape(LINES);
      stroke(purple);
      for (int i = 4; i < border.length; i++)
        q.vertex(border[i][0], border[i][1], border[i][2]);
      q.endShape();
    } // if
    if (p != null) shape(p);
    if (q != null) shape(q);
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

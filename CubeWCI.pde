class CubeWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, sides, weight, rotDir;
  boolean rotate;
  String type;

  // CubeWCI constructor
  CubeWCI(float x, float y, float z, int r, int s, boolean rot, String t) {
    xPos = x;
    yPos = y;
    zPos = z;
    cubeRad = r;
    sides = s;
    rotate = rot;
    type = t;
    rotAngle = 0;
    rotDir = 1;
    weight = cubeRad / 12;
  } // CubeWCI

  // Draw CubeWCI object to screen
  void display() {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(weight);
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    if (rotate) this.rotate();
    if (this.sides == 6) {
      stroke(191, 85, 255);
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
      stroke(255, 165, 17);
      if (this.type == "plain") {
        // Plain
        beginShape();
        vertex(cubeRad, cubeRad  - weight, -cubeRad + weight * 0.9);
        vertex(cubeRad, cubeRad  - weight, cubeRad);
        vertex(-cubeRad + weight * 0.9, cubeRad  - weight, cubeRad);
        vertex(-cubeRad + weight * 0.9, -cubeRad + weight, cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(cubeRad, -cubeRad + weight, -cubeRad + weight * 0.9);
        vertex(cubeRad, cubeRad - weight, -cubeRad  + weight * 0.9);
        vertex(cubeRad, cubeRad  - weight, cubeRad);
        endShape();
      } else if (this.type == "stripes") {
        // Stripes
        // Right
        beginShape();
        vertex(cubeRad, cubeRad - weight, cubeRad - (cubeRad));
        vertex(cubeRad, (cubeRad - weight), -cubeRad + weight);
        vertex(cubeRad, -cubeRad + weight, -cubeRad + weight);
        vertex(cubeRad, -cubeRad + weight, cubeRad - (cubeRad));
        endShape();
        // Left
        beginShape();
        vertex(cubeRad - (cubeRad), cubeRad - weight, cubeRad);
        vertex(-cubeRad + weight, cubeRad - weight, cubeRad);
        vertex(-cubeRad + weight, -cubeRad + weight, cubeRad);
        vertex(cubeRad - (cubeRad), -cubeRad + weight, cubeRad);
        endShape();
      } else if (this.type == "overhang") {
        // Overhang
        // Bottom chevron (R -> L)
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - cubeRad, cubeRad - weight, cubeRad);
        endShape();
        // Top chevron (L -> R)
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - cubeRad, -cubeRad + weight, cubeRad);
        endShape();
      } else if (this.type == "top") {
        // Top
        beginShape();
        vertex(cubeRad, -cubeRad - weight, -cubeRad);
        vertex(cubeRad, -cubeRad - weight, cubeRad);
        vertex(-cubeRad, -cubeRad - weight, cubeRad);
        endShape();
      } // if
    } else if (this.sides == 4) {
      stroke(191, 85, 255);
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
      stroke(255, 165, 17);
      if (this.type == "plain") {
        // Plain
        // Bottom chevron (R -> L)
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        // Top chevron (L -> R)
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
      } else if (this.type == "stripes") {
        // Stripes
        // Bottom right
        line(cubeRad, (cubeRad - weight), -cubeRad, cubeRad, cubeRad - weight, cubeRad - (cubeRad));
        // Top right
        line(cubeRad, -cubeRad + weight, -cubeRad, cubeRad, -cubeRad + weight, cubeRad - (cubeRad));
        // Bottom left
        line(-cubeRad, cubeRad - weight, cubeRad, cubeRad - (cubeRad), cubeRad - weight, cubeRad);
        // Top left
        line(-cubeRad, -cubeRad + weight, cubeRad, cubeRad - (cubeRad), -cubeRad + weight, cubeRad);
      } else if (this.type == "overhang") {
        // Overhang
        // Bottom chevron (R -> L)
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - cubeRad, cubeRad - weight, cubeRad);
        endShape();
        // Top chevron (L -> R)
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - cubeRad, -cubeRad + weight, cubeRad);
        endShape();
      } else if (this.type == "top") {
        // Top
        beginShape();
        vertex(cubeRad, -cubeRad - weight, -cubeRad);
        vertex(cubeRad, -cubeRad - weight, cubeRad);
        vertex(-cubeRad, -cubeRad - weight, cubeRad);
        endShape();
      } // if
    } else if (this.sides == 2) {
      stroke(191, 85, 255);
      line(cubeRad, cubeRad, cubeRad, -cubeRad, cubeRad, cubeRad);
      line(cubeRad, -cubeRad, -cubeRad, cubeRad, -cubeRad, cubeRad);
      stroke(255, 165, 17);
      if (this.type == "plain") {
        // Top right
        line(cubeRad, -cubeRad + weight, -cubeRad, cubeRad, -cubeRad + weight, cubeRad);
        // Bottom left
        line(-cubeRad, cubeRad - weight, cubeRad, cubeRad, cubeRad - weight, cubeRad);
      } else if (this.type == "stripes") {
        // Top right
        line(cubeRad, -cubeRad + weight, -cubeRad, cubeRad, -cubeRad + weight, cubeRad - (cubeRad));
        // Bottom left
        line(-cubeRad, cubeRad - weight, cubeRad, cubeRad - (cubeRad), cubeRad - weight, cubeRad);
      } else if (this.type == "overhang") {
        // Top right
        line(cubeRad, -cubeRad + weight, -cubeRad - (cubeRad), cubeRad, -cubeRad + weight, cubeRad);
        // Bottom left
        line(-cubeRad - (cubeRad), cubeRad - weight, cubeRad, cubeRad, cubeRad - weight, cubeRad);
      } else if (this.type == "top") {
        // Top right
        line(cubeRad, -cubeRad + weight, -cubeRad, cubeRad, -cubeRad + weight, cubeRad);
      } // if
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
} // CubeWCI

class CubeWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, weight, sides, rotDir;
  String rotate, type;
  float[][] border;
  float[][] fringe;

  // CubeWCI constructor
  CubeWCI(float x, float y, float z, int r, int s, String rot, String t) {
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
    border = new float[][] {
      {-cubeRad, -cubeRad, cubeRad}, // top left vertex
      {cubeRad, -cubeRad, cubeRad}, // top front vertex
      {cubeRad, -cubeRad, -cubeRad}, // top right vertex
      {cubeRad, cubeRad, -cubeRad}, // bottom right vertex
      {cubeRad, cubeRad, cubeRad}, // bottom front vertex
      {-cubeRad, cubeRad, cubeRad}, // bottom left vertex
    };
    fringe = new float[][] {
      {-cubeRad + weight * 0.9, -cubeRad + weight, cubeRad}, // top left vertex
      {cubeRad, -cubeRad + weight, cubeRad}, // top front vertex
      {cubeRad, -cubeRad + weight, -cubeRad + weight * 0.9}, // top right vertex
      {cubeRad, cubeRad - weight, -cubeRad  + weight * 0.9}, // bottom right vertex
      {cubeRad, cubeRad  - weight, cubeRad}, // bottom front vertex
      {-cubeRad + weight * 0.9, cubeRad  - weight, cubeRad} // bottom left vertex
    };
  } // CubeWCI

  // Draw CubeWCI object to screen
  void display() {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(weight);
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    PShape p = createShape();
    PShape q = createShape();
    if (rotate == "rotate") this.rotate();
    if (this.sides == 6) {
      // Border
      p.beginShape();
      p.stroke(191, 85, 255);
      for (int i = 0; i < border.length; i++) {
        p.vertex(border[i][0], border[i][1], border[i][2]);
      } // for
      p.endShape(CLOSE);
      // Fringe
      if (this.type == "plain") {
        // Plain
        q.beginShape();
        q.stroke(255, 165, 17);
          for (int j = 0; j < fringe.length; j++) {
            q.vertex(fringe[j][0], fringe[j][1], fringe[j][2]);
          } // for
        q.endShape(CLOSE);
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
      // Border
      p.beginShape();
      p.stroke(191, 85, 255);
      for (int i = 0; i < border.length / 2; i++) {
        p.vertex(border[i][0], border[i][1], border[i][2]);
      } // for
      p.endShape();
      q.beginShape();
      q.stroke(191, 85, 255);
      for (int i = 3; i < border.length; i++) {
        q.vertex(border[i][0], border[i][1], border[i][2]);
      }
      q.endShape();
      // Fringe
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
      } else if (this.type == "overhangGap") {
        // Overhang with gap
        // Bottom chevron (R -> L)
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        line(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, -cubeRad + weight, cubeRad);
      } else if (this.type == "floatingFringe") {
        // Floating fringe
        // Bottom chevron (R -> L)
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad);
        endShape();
        line(cubeRad, (cubeRad - weight), -cubeRad - cubeRad, cubeRad, (cubeRad - weight), -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, cubeRad - weight, cubeRad, -cubeRad - (1.5 * cubeRad), cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad);
        endShape();
        line(cubeRad, -cubeRad + weight, -cubeRad - cubeRad, cubeRad, -cubeRad + weight, -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, -cubeRad + weight, cubeRad, -cubeRad - (1.5 * cubeRad), -cubeRad + weight, cubeRad);
      } else if (this.type == "top") {
        // Top
        beginShape();
        vertex(cubeRad, -cubeRad - weight, -cubeRad);
        vertex(cubeRad, -cubeRad - weight, cubeRad);
        vertex(-cubeRad, -cubeRad - weight, cubeRad);
        endShape();
      } // if
    } else if (this.sides == 2) {
      // Border
      stroke(191, 85, 255);
      line(cubeRad, cubeRad, cubeRad, -cubeRad, cubeRad, cubeRad);
      line(cubeRad, -cubeRad, -cubeRad, cubeRad, -cubeRad, cubeRad);
      // Fringe
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
    if (p != null) shape(p);
    if (q != null) shape(q);
    popMatrix();
  } // display

  // Rotates CubeWCI objects 46 degrees back and forth
  // on the xy-plane between -22 and -68 degrees, starting
  // to the right
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

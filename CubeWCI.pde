class CubeWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, weight, sides, rotDir;
  String rotate, type;
  // int purple = #000000, orange = #000000;
  int purple = #A550E2, orange = #FFCF25;
  float[][] edges;
  float[][] plainSixEdgeFringe;
  float[][] plainFourAndTwoEdgeFringe;
  float[][] stripedSixEdgeFringe;
  float[][] stripedFourAndTwoEdgeFringe;\

  // CubeWCI constructor
  CubeWCI(float x, float y, float z, int r, int w, int s, String rot, String t) {
    xPos = x;
    yPos = y;
    zPos = z;
    cubeRad = r;
    sides = s;
    rotate = rot;
    type = t;
    rotAngle = 0;
    rotDir = 1;
    weight = w;
    edges = new float[][] {
      {-cubeRad, -cubeRad, cubeRad}, // top left vertex
      {cubeRad, -cubeRad, cubeRad}, // top front vertex
      {cubeRad, -cubeRad, -cubeRad}, // top right vertex
      {cubeRad, cubeRad, -cubeRad}, // bottom right vertex
      {cubeRad, cubeRad, cubeRad}, // bottom front vertex
      {-cubeRad, cubeRad, cubeRad}, // bottom left vertex
    };
    plainSixEdgeFringe = new float[][] {
      {-cubeRad + weight * 0.9, -cubeRad + weight, cubeRad}, // top left vertex
      {cubeRad, -cubeRad + weight, cubeRad}, // top front vertex
      {cubeRad, -cubeRad + weight, -cubeRad + weight * 0.9}, // top right vertex
      {cubeRad, cubeRad - weight, -cubeRad  + weight * 0.9}, // bottom right vertex
      {cubeRad, cubeRad  - weight, cubeRad}, // bottom front vertex
      {-cubeRad + weight * 0.9, cubeRad  - weight, cubeRad} // bottom left vertex
    };
    plainFourAndTwoEdgeFringe = new float[][] {
      {-cubeRad, -cubeRad + weight, cubeRad}, // top left vertex
      {cubeRad, -cubeRad + weight, cubeRad}, // top front vertex
      {cubeRad, -cubeRad + weight, -cubeRad}, // top right vertex
      {cubeRad, cubeRad - weight, -cubeRad}, // bottom right vertex
      {cubeRad, cubeRad - weight, cubeRad}, // bottom front vertex
      {-cubeRad, cubeRad  - weight, cubeRad} // bottom left vertex
    };
    stripedSixEdgeFringe = new float[][] {
      {cubeRad - cubeRad, -cubeRad + weight, cubeRad},
      {-cubeRad + weight, -cubeRad + weight, cubeRad},
      {-cubeRad + weight, cubeRad - weight, cubeRad},
      {cubeRad - cubeRad, cubeRad - weight, cubeRad},
      {cubeRad, -cubeRad + weight, cubeRad - cubeRad},
      {cubeRad, -cubeRad + weight, -cubeRad + weight},
      {cubeRad, cubeRad - weight, -cubeRad + weight},
      {cubeRad, cubeRad - weight, cubeRad - cubeRad}
    };
    stripedFourAndTwoEdgeFringe = new float[][] {
      {-cubeRad, -cubeRad + weight, cubeRad}, // top left
      {cubeRad - cubeRad, -cubeRad + weight, cubeRad},
      {-cubeRad, cubeRad - weight, cubeRad}, // bottom left
      {cubeRad - cubeRad, cubeRad - weight, cubeRad},
      {cubeRad, -cubeRad + weight, -cubeRad}, // top right
      {cubeRad, -cubeRad + weight, cubeRad - cubeRad},
      {cubeRad, (cubeRad - weight), -cubeRad}, // bottom right
      {cubeRad, cubeRad - weight, cubeRad - (cubeRad)}
    };
  } // CubeWCI

  // Draw CubeWCI object to screen
  void display() {
    translate(xPos, yPos, zPos);
    strokeWeight(weight);
    rotateX(radians(-25)); // re-align
    rotateY(radians(-45)); // cube
    PShape border = createShape();
    PShape fringe = createShape();
    PShape borderTop = createShape();
    PShape borderBottom = createShape();
    PShape leftFringe = createShape();
    PShape rightFringe = createShape();
    PShape fringeTop = createShape();
    PShape fringeBottom = createShape();
    if (this.rotate == "rotate") this.rotate();
    if (this.sides == 6) {
      // Border
      border.beginShape();
      border.stroke(purple);
      for (int i = 0; i < edges.length; i++)
        border.vertex(edges[i][0], edges[i][1], edges[i][2]);
      border.endShape(CLOSE);
      // Fringe
      if (this.type == "plain") {
        // Plain
        fringe.beginShape();
        fringe.stroke(orange);
        for (int j = 0; j < plainSixEdgeFringe.length; j++)
          fringe.vertex(plainSixEdgeFringe[j][0], plainSixEdgeFringe[j][1], plainSixEdgeFringe[j][2]);
        fringe.endShape(CLOSE);
      } else if (this.type == "stripes") {
        // Striped
        leftFringe.beginShape();
        leftFringe.stroke(orange);
        for (int j = 0; j < stripedSixEdgeFringe.length / 2; j++)
          leftFringe.vertex(stripedSixEdgeFringe[j][0], stripedSixEdgeFringe[j][1], stripedSixEdgeFringe[j][2]);
        leftFringe.endShape();
        rightFringe.beginShape();
        rightFringe.stroke(orange);
        for (int j = stripedSixEdgeFringe.length / 2; j < stripedSixEdgeFringe.length; j++)
          rightFringe.vertex(stripedSixEdgeFringe[j][0], stripedSixEdgeFringe[j][1], stripedSixEdgeFringe[j][2]);
        rightFringe.endShape();
      } else if (this.type == "top") {
        // Top
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad - weight, -cubeRad);
        vertex(cubeRad, -cubeRad - weight, cubeRad);
        vertex(-cubeRad, -cubeRad - weight, cubeRad);
        endShape();
      } // if
    } else if (this.sides == 4) {
      // Border
      borderTop.beginShape();
      borderTop.stroke(purple);
      for (int i = 0; i < edges.length / 2; i++)
        borderTop.vertex(edges[i][0], edges[i][1], edges[i][2]);
      borderTop.endShape();
      borderBottom.beginShape();
      borderBottom.stroke(purple);
      for (int i = 3; i < edges.length; i++)
        borderBottom.vertex(edges[i][0], edges[i][1], edges[i][2]);
      borderBottom.endShape();
      // Fringe
      if (this.type == "plain") {
        // Plain
        fringeTop.beginShape();
        fringeTop.stroke(orange);
        for (int j = 0; j < plainFourAndTwoEdgeFringe.length / 2; j++)
          fringeTop.vertex(plainFourAndTwoEdgeFringe[j][0], plainFourAndTwoEdgeFringe[j][1], plainFourAndTwoEdgeFringe[j][2]);
        fringeTop.endShape();
        fringeBottom.beginShape();
        fringeBottom.stroke(orange);
        for (int j = plainFourAndTwoEdgeFringe.length / 2; j < plainFourAndTwoEdgeFringe.length; j++)
          fringeBottom.vertex(plainFourAndTwoEdgeFringe[j][0], plainFourAndTwoEdgeFringe[j][1], plainFourAndTwoEdgeFringe[j][2]);
        fringeBottom.endShape();
      } else if (this.type == "stripes") {
        // Striped
        leftFringe.beginShape(LINES);
        leftFringe.stroke(orange);
        for (int j = 0; j < 2; j++)
          leftFringe.vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        for (int j = 2; j < 4; j++)
          leftFringe.vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        leftFringe.endShape();
        rightFringe.beginShape(LINES);
        rightFringe.stroke(orange);
        for (int j = 4; j < 6; j++)
          rightFringe.vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        for (int j = 6; j < 8; j++)
          rightFringe.vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        rightFringe.endShape();
      } else if (this.type == "overhang") {
        // Overhang
        // Bottom chevron (R -> L)
        stroke(orange);
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
        stroke(orange);
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
      } else if (this.type == "floatingFringe") {
        // Floating fringe
        // Bottom chevron (R -> L)
        stroke(orange);
        beginShape();
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        line(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        stroke(orange);
        beginShape();
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, -cubeRad + weight, cubeRad);
      } else if (this.type == "top") {
        // Top
        stroke(orange);
        beginShape();
        vertex(cubeRad, -cubeRad - weight, -cubeRad);
        vertex(cubeRad, -cubeRad - weight, cubeRad);
        vertex(-cubeRad, -cubeRad - weight, cubeRad);
        endShape();
      } // if
    } else if (this.sides == 2) {
      // Border
      borderTop.beginShape(LINES);
      borderTop.stroke(purple);
      for (int i = 1; i < edges.length / 2; i++)
        borderTop.vertex(edges[i][0], edges[i][1], edges[i][2]);
      borderTop.endShape();
      borderBottom.beginShape(LINES);
      borderBottom.stroke(purple);
      for (int i = 4; i < edges.length; i++)
        borderBottom.vertex(edges[i][0], edges[i][1], edges[i][2]);
      borderBottom.endShape();
      // Fringe
      if (this.type == "plain") {
        fringeTop.beginShape(LINES);
        fringeTop.stroke(orange);
        for (int i = 1; i < plainFourAndTwoEdgeFringe.length / 2; i++)
          fringeTop.vertex(plainFourAndTwoEdgeFringe[i][0], plainFourAndTwoEdgeFringe[i][1], plainFourAndTwoEdgeFringe[i][2]);
        fringeTop.endShape();
        fringeBottom.beginShape(LINES);
        fringeBottom.stroke(orange);
        for (int i = 4; i < plainFourAndTwoEdgeFringe.length; i++)
          fringeBottom.vertex(plainFourAndTwoEdgeFringe[i][0], plainFourAndTwoEdgeFringe[i][1], plainFourAndTwoEdgeFringe[i][2]);
        fringeBottom.endShape();
      } // if
    }
    if (this.sides == 6) {
      pushMatrix();
      shape(border);
      if (type == "plain") {
        shape(fringe);
      } else if (type == "stripes") {
        shape(leftFringe);
        shape(rightFringe);
      } // if
      popMatrix();
    } else {
      pushMatrix();
      shape(borderTop);
      shape(borderBottom);
      if (type == "plain") {
        shape(fringeTop);
        shape(fringeBottom);
      } else if (type == "stripes") {
        shape(leftFringe);
        shape(rightFringe);
      } // if
      popMatrix();
    } // if
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
  
} // CubeWCI

class FringeWCI {
  float xPos, yPos, zPos, rotAngle;
  int cubeRad, weight, sides, rotDir;
  boolean rotate;
  String type;
  int purple = #A550E2, orange = #FFCF25, blue = #24D1FF;
  
  // Initialize fringe coordinates
  float[][] plainSixEdgeFringe;
  float[][] plainFourAndTwoEdgeFringe;
  float[][] stripedSixEdgeFringe;
  float[][] stripedFourAndTwoEdgeFringe;
  
  /* 
   |----------------------------------------------------
   | FringeWCI constructor
   |----------------------------------------------------
   |  - Position at (pos[0], pos[1], pos[2]) on screen
   |  - Length of cube edge = r 
   |  - Weight of lines = w
   |  - Number of sides = s
   |  - Direction of rotation = dir
   |  - Rotating vs still = rot
   |----------------------------------------------------
   */
  public FringeWCI(float[] pos, int r, int w, int s, int dir, boolean rot, String t) {
    xPos = pos[0];
    yPos = pos[1];
    zPos = pos[2];
    cubeRad = r;
    sides = s;
    rotate = rot;
    type = t;
    rotAngle = 0;
    rotDir = dir;
    weight = w;
    
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
    
  } // FringeWCI
  
  public void display() {
    translate(xPos, yPos, zPos);
    rotateX(radians(-20)); // re-align
    rotateY(radians(-45)); // cube
    
    if (this.rotate == true) this.rotate();
    
    if (this.sides == 6) {
      // Fringe
      if (this.type == "plain") {
        // Plain
        beginShape();
        stroke(orange);
        for (int j = 0; j < plainSixEdgeFringe.length; j++)
          vertex(plainSixEdgeFringe[j][0], plainSixEdgeFringe[j][1], plainSixEdgeFringe[j][2]);
        endShape(CLOSE);
      } else if (this.type == "stripes") {
        // Striped
        beginShape();
        stroke(orange);
        for (int j = 0; j < stripedSixEdgeFringe.length / 2; j++)
          vertex(stripedSixEdgeFringe[j][0], stripedSixEdgeFringe[j][1], stripedSixEdgeFringe[j][2]);
        endShape();
        beginShape();
        stroke(orange);
        for (int j = stripedSixEdgeFringe.length / 2; j < stripedSixEdgeFringe.length; j++)
          vertex(stripedSixEdgeFringe[j][0], stripedSixEdgeFringe[j][1], stripedSixEdgeFringe[j][2]);
        endShape();
      } // if
    } else if (this.sides == 4) {
      // Fringe
      if (this.type == "plain") {
        // Plain
        beginShape();
        stroke(orange);
        for (int j = 0; j < plainFourAndTwoEdgeFringe.length / 2; j++)
          vertex(plainFourAndTwoEdgeFringe[j][0], plainFourAndTwoEdgeFringe[j][1], plainFourAndTwoEdgeFringe[j][2]);
        endShape();
        beginShape();
        stroke(orange);
        for (int j = plainFourAndTwoEdgeFringe.length / 2; j < plainFourAndTwoEdgeFringe.length; j++)
          vertex(plainFourAndTwoEdgeFringe[j][0], plainFourAndTwoEdgeFringe[j][1], plainFourAndTwoEdgeFringe[j][2]);
        endShape();
      } else if (this.type == "stripes") {
        // Striped
        beginShape(LINES);
        stroke(orange);
        for (int j = 0; j < 4; j++)
          vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        endShape();
        beginShape(LINES);
        stroke(orange);
        for (int j = 4; j < 8; j++)
          vertex(stripedFourAndTwoEdgeFringe[j][0], stripedFourAndTwoEdgeFringe[j][1], stripedFourAndTwoEdgeFringe[j][2]);
        endShape();
      } else if (this.type == "overhang") {
        // Overhang
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - cubeRad, cubeRad - weight, cubeRad);
        endShape();
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - cubeRad, -cubeRad + weight, cubeRad);
        endShape();
      } else if (this.type == "overhangGap") {
        // Overhang with gap
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, (cubeRad - weight), -cubeRad - cubeRad, cubeRad, (cubeRad - weight), -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, cubeRad - weight, cubeRad, -cubeRad - (1.5 * cubeRad), cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - cubeRad, cubeRad, -cubeRad + weight, -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, -cubeRad + weight, cubeRad, -cubeRad - (1.5 * cubeRad), -cubeRad + weight, cubeRad);
      } else if (this.type == "overhangLargeGap") {
        // Overhang with larger gap a
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, (cubeRad - weight), -cubeRad - (1.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - (2.0 * cubeRad));
        line(-cubeRad - (1.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - (2.0 * cubeRad), cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - (1.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - (2.0 * cubeRad));
        line(-cubeRad - (1.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - (2.0 * cubeRad), -cubeRad + weight, cubeRad);
      } else if (this.type == "overhangCorner") {
        // Overhang with corner
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex((1.5 * cubeRad), cubeRad - weight, (-2.0 * cubeRad));
        vertex((1.5 * cubeRad), (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, (1.5 * cubeRad));
        vertex((-2.0 * cubeRad), cubeRad - weight, (1.5 * cubeRad));
        endShape();
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex((1.5 * cubeRad), -cubeRad + weight, (-2.0 * cubeRad));
        vertex((1.5 * cubeRad), -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, (1.5 * cubeRad));
        vertex((-2.0 * cubeRad), -cubeRad + weight, (1.5 * cubeRad));
        endShape();
      } else if (this.type == "overhangGapCorner") {
        // Overhang with gap + corner
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad);
        endShape();
        // Right corner
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        vertex(cubeRad, (cubeRad - weight), -cubeRad - (1.5 * cubeRad));
        vertex((1.5 * cubeRad), (cubeRad - weight), -cubeRad - (1.5 * cubeRad));
        vertex((1.5 * cubeRad), (cubeRad - weight), -cubeRad - (2.0 * cubeRad));
        endShape();
        // Left Corner
        beginShape();
        stroke(orange);
        vertex(-cubeRad - cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad - (1.5 * cubeRad), cubeRad - weight, cubeRad);
        vertex(-cubeRad - (1.5 * cubeRad), cubeRad - weight, (1.5 * cubeRad));
        vertex(-cubeRad - (2.0 * cubeRad), cubeRad - weight, (1.5 * cubeRad));
        endShape();
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad));
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad);
        endShape();
        // Right corner
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        vertex(cubeRad, -cubeRad + weight, -cubeRad - (1.5 * cubeRad));
        vertex((1.5 * cubeRad), -cubeRad + weight, -cubeRad - (1.5 * cubeRad));
        vertex((1.5 * cubeRad), -cubeRad + weight, -cubeRad - (2.0 * cubeRad));
        endShape();
        // Left corner
        beginShape();
        stroke(orange);
        vertex(-cubeRad - cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (1.5 * cubeRad), -cubeRad + weight, cubeRad);
        vertex(-cubeRad - (1.5 * cubeRad), -cubeRad + weight, (1.5 * cubeRad));
        vertex(-cubeRad - (2.0 * cubeRad), -cubeRad + weight, (1.5 * cubeRad));
        endShape();
      } else if (this.type == "floatingFringe") {
        // Floating fringe with small gap
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, -cubeRad + weight, cubeRad);
      } else if (this.type == "floatingLargeGap") {
        // Floating fringe with large gap
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, (cubeRad - weight), -cubeRad - cubeRad, cubeRad, cubeRad - weight, -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, cubeRad - weight, cubeRad, -cubeRad - (1.5 * cubeRad), cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - cubeRad, cubeRad, -cubeRad + weight, -cubeRad - (1.5 * cubeRad));
        line(-cubeRad - cubeRad, -cubeRad + weight, cubeRad, -cubeRad - (1.5 * cubeRad), -cubeRad + weight, cubeRad);
      } else if (this.type == "floatingFringeBlue") {
        // Floating fringe with small gap
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        stroke(blue);
        line(cubeRad, (cubeRad - weight), -cubeRad - (0.5 * cubeRad), cubeRad, (cubeRad - weight), -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, cubeRad - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        stroke(blue);
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, -cubeRad + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, -cubeRad + weight, cubeRad);
      } else if (this.type == "skewInward") {
        // Skew inward
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, cubeRad - weight, -cubeRad - (0.5 * cubeRad), cubeRad, (0.85 * cubeRad) - weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, (0.85 * cubeRad) - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, (0.85 * -cubeRad) + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, (0.85 * -cubeRad) + weight, cubeRad);
      } else if (this.type == "skewOutward") {
        // Skew outward
        // Bottom chevron (R -> L)
        beginShape();
        stroke(orange);
        vertex(cubeRad, (cubeRad - weight), -cubeRad);
        vertex(cubeRad, cubeRad - weight, cubeRad);
        vertex(-cubeRad, cubeRad - weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, cubeRad - weight, -cubeRad - (0.5 * cubeRad), cubeRad, (1.15 * cubeRad) - weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), cubeRad - weight, cubeRad, -cubeRad - cubeRad, (1.15 * cubeRad) - weight, cubeRad);
        // Top chevron (L -> R)
        beginShape();
        stroke(orange);
        vertex(cubeRad, -cubeRad + weight, -cubeRad);
        vertex(cubeRad, -cubeRad + weight, cubeRad);
        vertex(-cubeRad, -cubeRad + weight, cubeRad);
        endShape();
        stroke(orange);
        line(cubeRad, -cubeRad + weight, -cubeRad - (0.5 * cubeRad), cubeRad, (1.15 * -cubeRad) + weight, -cubeRad - cubeRad);
        line(-cubeRad - (0.5 * cubeRad), -cubeRad + weight, cubeRad, -cubeRad - cubeRad, (1.15 * -cubeRad) + weight, cubeRad);
      } // if

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
  
} // FringeWCI

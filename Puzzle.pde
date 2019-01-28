class Puzzle {

  int[][] puzzle;
  boolean updated;

  Puzzle(int vals[][]) {
    puzzle = new int[9][9];
    for (int c = 0; c < 9; c++) {
      for (int r = 0; r < 9; r++) {
        puzzle[r][c] = vals[r][c];
      }
    }
    updated = true;
  }

  void display(float x, float y, float size) {
    strokeWeight(1);
    textSize(size * 0.7);
    textAlign(CENTER, CENTER);
    for (int c = 0; c < 9; c++) {
      for (int r = 0; r < 9; r++) {
        // coordinates of top left of each cell offset
        float cx = x + size * c;
        float cy = y + size * r;
        // create rectangle
        fill(255);
        stroke(0);
        rect(cx, cy, size, size);
        // write number
        fill(0);
        if (puzzle[r][c] != 0) {
          // TODO account for text not being perfectly centered
          text(puzzle[r][c], cx + size / 2, cy + size / 2);//, cx + size, cy + size);
        }
      }
    }
    // block bordes
    strokeWeight(2);
    line(x + 3 * size, y + 0, x + 3 * size, y + 9 * size);
    line(x + 6 * size, y + 0, x + 6 * size, y + 9 * size);
    line(x + 0, y + 3 * size, x + 9 * size, y + 3 * size);
    line(x + 0, y + 6 * size, x + 9 * size, y + 6 * size);
    updated = false;
  }

  boolean isValid() {
    // TODO
    int[] vals = new int[10];
    // check rows
    for (int r = 0; r < 9; r++) {
      for (int i = 0; i < 10; i++) {
        vals[i] = 0;
      }
      for (int c = 0; c < 9; c++) {
        vals[puzzle[r][c]]++;
      }
      for (int i = 1; i < 10; i++) {
        if (vals[i] > 1) {
          return false;
        }
      }
    }

    // check cols
    for (int c = 0; c < 9; c++) {
      for (int i = 0; i < 10; i++) {
        vals[i] = 0;
      }
      for (int r = 0; r < 9; r++) {
        vals[puzzle[r][c]]++;
      }
      for (int i = 1; i < 10; i++) {
        if (vals[i] > 1) {
          return false;
        }
      }
    }

    // check blocks
    for (int br = 1; br < 9; br += 3) {
      for (int bc = 1; bc < 9; bc += 3) {
        for (int i = 0; i < 10; i++) {
          vals[i] = 0;
        }
        // println("checking block centered at " + br + "," + bc);
        for (int r = br - 1; r <= br + 1; r++) {
          for (int c = bc - 1; c <= bc + 1; c++) {
            // println(r + "," + c);
            vals[puzzle[r][c]]++;
          }
          for (int i = 1; i < 10; i++) {
            if (vals[i] > 1) {
              // println("Block invalid centering at " + br + "," + bc + "with value " + i);
              return false;
            }
          }
        }
      }
    }

    return true;
  }

  boolean isSolved() {
    // TODO
    int[] vals = new int[10];
    // zero values count
    for (int i = 0; i < 10; i++) {
      vals[i] = 0;
    }
    // count value
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        vals[puzzle[r][c]]++;
      }
    }
    // check counts
    for (int i = 0; i < 10; i++) {
      if (vals[i] != 9) {
        return false;
      }
    }
    return true;
  }

  Puzzle copy() {
    return new Puzzle(puzzle);
  }

  void setTile(int c, int r, int value) {
    puzzle[r][c] = value;
    updated = true;
  }
}

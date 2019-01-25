class Puzzle {

 int[][] puzzle;

  Puzzle(int vals[][]) {
    puzzle = new int[9][9];
    for (int c = 0; c < 9; c++) {
      for (int r = 0; r < 9; r++) {
        puzzle[r][c] = vals[r][c];
      }
    }
    // TODO
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
  }

  boolean isValid() {
    // TODO
    return false;
  }

  boolean isComplete() {
    // TODO
    return false;
  }

  Puzzle copy() {
    return new Puzzle(puzzle);
  }
}

class BruteSolver implements Solver {

  Puzzle puzzle;
  Puzzle original;
  int steps;
  ArrayList<int[]> moves;

  BruteSolver(Puzzle puzzle) {
    this.puzzle = puzzle.copy();
    original = puzzle.copy();
    steps = 0;
    moves = new ArrayList<int[]>();
  }

  void display(float x, float y, float size) {
    puzzle.display(x, y, size);
  }

  int[] findNextEmpty() {
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (puzzle.puzzle[r][c] == 0) {
          int[] loc= new int[3];
          loc[0] = c;
          loc[1] = r;
          loc[2] = 0;
          return loc;
        }
      }
    }
    return null;
  }

  void solveCell() {
    // check if puzzle is already complete
    if (puzzle.isSolved()) {
      return;
    }
    // if current state is valid work on next cell
    if (puzzle.isValid()) {
      int[] loc = findNextEmpty();
      if (loc != null) {
        loc[2] = 1;
        puzzle.setTile(loc[0], loc[1], loc[2]);
        moves.add(loc);
        steps++;
      }
    }
    // if state is invalid increment previous cell
    // if last cell was 9 clear it and move to previous cell
    else {
      // remove all moves from end that are already 9
      while (moves.size() > 0 && moves.get(moves.size()-1)[2] == 9) {
        int[] val = moves.get(moves.size()-1);
        val[2] = 0;
        puzzle.setTile(val[0], val[1], val[2]);
        moves.remove(moves.size()-1);
      }
      // increment last move and update puzzle
      moves.get(moves.size()-1)[2]++;
      int[] val = moves.get(moves.size()-1);
      puzzle.setTile(val[0], val[1], val[2]);
      steps++;
    }
  }

  void solvePuzzle() {
    while (!isSolved()) {
      solveCell();
    }
  }


  boolean isSolved() {
    return puzzle.isSolved();
  }


  boolean isValid() {
    return puzzle.isValid();
  }

  int getSteps() {
    return steps;
  }

  boolean isUpdated() {
    return puzzle.updated;
  }

  Puzzle getPuzzle() {
    return puzzle;
  }
}

class BruteSolver implements Solver {

  Puzzle puzzle;
  Puzzle original;
  int steps;

  BruteSolver(Puzzle puzzle) {
    this.puzzle = puzzle.copy();
    original = puzzle.copy();
    steps = 0;
  }

  void display(float x, float y, float size) {
    puzzle.display(x, y, size);
  }

  void solveCell() {
    // TODO
  }

  void solvePuzzle() {
    // TODO
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

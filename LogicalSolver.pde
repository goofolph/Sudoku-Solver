class LogicalSolver implements Solver {

  Puzzle puzzle;
  Puzzle original;
  int steps;

  LogicalSolver(Puzzle puzzle) {
    this.puzzle = puzzle.copy();
    original = puzzle.copy();
    steps = 0;
  }

  void display(float x, float y, float size) {
    if (puzzle.updated) {
      puzzle.display(x, y, size);
    }
  }

  void solveCell() {
    // TODO
  }

  void solvePuzzle() {
    // TODO
  }


  boolean isSolved() {
    // TODO
    return false;
  }


  boolean isValid() {
    // TODO
    return false;
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

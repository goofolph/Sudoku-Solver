interface Solver {
  void display(float x, float y, float size);
  void solveCell();
  void solvePuzzle();
  boolean isSolved();
  boolean isValid();
  int getSteps();
  boolean isUpdated();
  Puzzle getPuzzle();
}

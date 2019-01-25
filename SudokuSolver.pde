Puzzle puzzle;
Solver brute;
Solver logic;
float size;

void setup() {
  size(800, 540);
  background(255);

  size = min(width/9, height/9);

  int puzzle1[][] = { {1, 0, 0, 0, 5, 0, 9, 6, 0},
                      {3, 0, 0, 2, 0, 1, 8, 0, 0},
                      {0, 0, 0, 0, 0, 3, 0, 0, 0},
                      {8, 0, 2, 0, 0, 4, 0, 0, 0},
                      {7, 0, 1, 0, 0, 0, 5, 0, 4},
                      {0, 0, 0, 9, 0, 0, 2, 0, 8},
                      {0, 0, 0, 3, 0, 0, 0, 0, 0},
                      {0, 0, 6, 1, 0, 2, 0, 0, 5},
                      {0, 3, 8, 0, 4, 0, 0, 0, 9} };

  puzzle = new Puzzle(puzzle1);
  brute = new BruteSolver(puzzle);
  logic = new LogicalSolver(puzzle);
}

void draw() {
  background(255);
  brute.display(0, 0, size);
  displayStats();
}

void displayStats() {
  fill(255);
  stroke(0);
  String stats = "";

  textSize(20);
  text(stats, size * 9 + 10, 0, width, height);
}

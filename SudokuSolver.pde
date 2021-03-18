Puzzle puzzle;
Puzzle puzzle2;
Solver brute;
Solver logic;
float size;
int cellsPerFrame = 60;

void setup() {
  size(800, 540);
  frameRate(60);
  background(255);

  size = min(width/9, height/9);

  // same moderate puzzle
  int puzMod[][] = { {1, 0, 0, 0, 5, 0, 9, 6, 0},
                     {3, 0, 0, 2, 0, 1, 8, 0, 0},
                     {0, 0, 0, 0, 0, 3, 0, 0, 0},
                     {8, 0, 2, 0, 0, 4, 0, 0, 0},
                     {7, 0, 1, 0, 0, 0, 5, 0, 4},
                     {0, 0, 0, 9, 0, 0, 2, 0, 8},
                     {0, 0, 0, 3, 0, 0, 0, 0, 0},
                     {0, 0, 6, 1, 0, 2, 0, 0, 5},
                     {0, 3, 8, 0, 4, 0, 0, 0, 9} };
  int puzDif[][] = { {5, 0, 9, 7, 0, 0, 0, 0, 1},
                     {0, 0, 2, 0, 0, 0, 0, 8, 0},
                     {0, 0, 0, 8, 0, 0, 2, 0, 0},
                     {6, 0, 4, 0, 0, 1, 0, 3, 0},
                     {0, 0, 0, 0, 0, 0, 0, 0, 0},
                     {0, 7, 0, 5, 0, 0, 6, 0, 9},
                     {0, 0, 6, 0, 0, 3, 0, 0, 0},
                     {0, 1, 0, 0, 0, 0, 4, 0, 0},
                     {8, 0, 0, 0, 0, 4, 9, 0, 7} };
  int puzImp[][] = { {8, 0, 0, 0, 0, 0, 0, 0, 0},
                     {0, 0, 3, 6, 0, 0, 0, 0, 0},
                     {0, 7, 0, 0, 9, 0, 2, 0, 0},
                     {0, 5, 0, 0, 0, 7, 0, 0, 0},
                     {0, 0, 0, 0, 4, 5, 7, 0, 0},
                     {0, 0, 0, 1, 0, 0, 0, 3, 0},
                     {0, 0, 1, 0, 0, 0, 0, 6, 8},
                     {0, 0, 8, 5, 0, 0, 0, 1, 0},
                     {0, 9, 0, 0, 0, 0, 4, 0, 0} };

  puzzle = new Puzzle(puzImp);
  brute = new BruteSolver(puzzle);
  logic = new LogicalSolver(puzzle);
}

void draw() {
  background(255);
  brute.display(0, 0, size);
  displayStats();
  for (int i = 0; i < cellsPerFrame; i++) {
    brute.solveCell();
  }
}

void displayStats() {
  fill(0);
  String stats = "";
  stats += "Steps: " + brute.getSteps() + "\n";
  stats += "Is Valid:" + brute.isValid() + "\n";
  stats += "Is Solved:" + brute.isSolved() + "\n";
  stats += "Framerate: " + (int) frameRate + "\n";

  textSize(20);
  textAlign(LEFT, TOP);
  // text(stats, size * 9 + 10, 0, width, height);
  text(stats, size * 9 + 10, 10);
}

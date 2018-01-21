# Sudoku
Solving sudoku grid (ruby language)

The purpose of this program is to solve a sudoku problem.

Sudoku grid is 9x9 grid subdivided in 9 subgrids (3x3).
Figures from 1 to 9 only appear precisely 9 times each, following several rules.
These fundamental rules are the following:
- no identical figure in a row among the 9 rows
- no identical figure in a column among the 9 columns
- no identical figure in a subgrid among the 9 subgrids.

The main steps are the following:
- fill the blank with the 9 eventual figures
- apply the 3 fundamental rules, each in 2 differents ways:
- \ remove an eventual figure from a cell if this figure is sure forbidden
- \ put a uniq figure in a cell if the figure is the only solution
- consider grid solved only if every cell has a uniq figure.

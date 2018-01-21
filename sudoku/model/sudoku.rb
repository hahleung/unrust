#Sudoku solver
input_example = [
  ["x","x","x","x",7,"x","x","x","x"],
  ["x","x","x","x","x","x",9,"x",1],
  ["x","x",8,1,"x","x",2,4,3],
  ["x","x",9,"x","x",5,"x",2,"x"],
  [2,"x","x","x","x",7,"x","x",8],
  ["x","x","x",6,4,"x","x",5,"x"],
  ["x",2,4,"x","x","x","x","x","x"],
  ["x","x",1,7,"x",4,"x","x",5],
  ["x",5,6,"x",9,"x","x",1,"x"]]

input_blank = Array.new(9, Array.new(9, "x"))

def grid_generator(name, feed)
  input_file = File.open("#{name}.txt", 'w')
  9.times do |x|
    9.times do |y|
      input_file.write(feed[x][y])
      if y == 2 || y == 5
        input_file.write("\t")
        input_file.write("*")
      end
      input_file.write("\t")
    end
    if x == 2 || x == 5
      input_file.write("\n")
      input_file.write("*"*82)
    end
    input_file.write("\n")
  end
  input_file.close
end

input_name = "input_grid_#{Time.now}"
grid_generator(input_name, input_example)

p "Grid was generated, see #{input_name}.txt."
p "Please indicate x for each blank."
p "Press Enter to confirm the solving of the grid."
gets
p "Grid to solve has been stored in #{input_name}.txt."
input_user = File.readlines("#{input_name}.txt").map{|x| x.chomp.split("\t").delete_if{|x| x.include?("*")}}.reject(&:empty?)

#Insert here test for grid conformity
# 3 primary rules
# file blank with "x"

input = input_user
main_grid = input.map{|i| i.map{|e| (e == "x" ? (1..9).to_a : [e.to_i]) }}

# x is the index of row
# y is the index of column
t = {}
9.times do |x|
  9.times do |y|
    t.store([x, y], main_grid[x][y])
  end
end

def what_subgrid(cell)
  if cell[0] <= 2
    horizontal = [1, 2, 3]
  elsif cell[0] >= 6
    horizontal = [7, 8, 9]
  else
    horizontal = [4, 5, 6]
  end

  if cell[1] <= 2
    vertical = [1, 4, 7]
  elsif cell[1] >= 6
    vertical = [3, 6, 9]
  else
    vertical = [2, 5, 8]
  end

  (horizontal&vertical)[0]
end

def subgrid_other_cells(grid, cell)
  subgrid = what_subgrid(cell)
  case subgrid
  when 1
    return grid.select{ |k, v| (k != cell)and(k[0].between?(0, 2))and(k[1].between?(0, 2)) }
  when 2
    return grid.select{ |k, v| (k != cell)and(k[0].between?(0, 2))and(k[1].between?(3, 5)) }
  when 3
    return grid.select{ |k, v| (k != cell)and(k[0].between?(0, 2))and(k[1].between?(6, 8)) }
  when 4
    return grid.select{ |k, v| (k != cell)and(k[0].between?(3, 5))and(k[1].between?(0, 2)) }
  when 5
    return grid.select{ |k, v| (k != cell)and(k[0].between?(3, 5))and(k[1].between?(3, 5)) }
  when 6
    return grid.select{ |k, v| (k != cell)and(k[0].between?(3, 5))and(k[1].between?(6, 8)) }
  when 7
    return grid.select{ |k, v| (k != cell)and(k[0].between?(6, 8))and(k[1].between?(0, 2)) }
  when 8
    return grid.select{ |k, v| (k != cell)and(k[0].between?(6, 8))and(k[1].between?(3, 5)) }
  when 9
    return grid.select{ |k, v| (k != cell)and(k[0].between?(6, 8))and(k[1].between?(6, 8)) }
  end
end

def row_other_cells(grid, cell)
  grid.select { |key, value| (key != cell)and(key[0] == cell[0]) }
end

def column_other_cells(grid, cell)
  grid.select { |key,value| (key != cell)and(key[1] == cell[1]) }
end

def figure(hash)
  hash.select{ |k,v| (v.length == 1)}.values
end

def epured_cell(grid, cell)
  if grid[cell].length == 1
    return grid[cell]
  end

  base = (1..9).to_a
  authorized_figures_subgrid = base - subgrid_other_cells(grid, cell).values.flatten.uniq.sort
  authorized_figures_row = base - row_other_cells(grid, cell).values.flatten.uniq.sort
  authorized_figures_column = base - column_other_cells(grid, cell).values.flatten.uniq.sort

  if authorized_figures_subgrid.length == 1
    authorized_figures_subgrid
  elsif authorized_figures_row.length == 1
    authorized_figures_row
  elsif authorized_figures_column.length == 1
    authorized_figures_column
  else
    impossible_figures = (figure(row_other_cells(grid, cell)) + figure(column_other_cells(grid, cell)) + figure(subgrid_other_cells(grid, cell))).flatten
    grid[cell] - impossible_figures
  end
end

n_ini = 0
def solving_sudoku(grid, n)
  solving_grid = {}
  9.times do |x|
    9.times do |y|
      solving_grid.store([x,y], epured_cell(grid, [x, y]))
    end
  end
  n_iter = n + 1

  p n
  p solving_grid.values.flatten.length
  if n_iter > 20
    p "Unsolved after #{n_iter} iterations."
    exit
  end
  unless solving_grid.values.flatten.length == 81
    solving_sudoku(solving_grid, n_iter)
  else
    [solving_grid, n_iter]
  end
end

output = main_grid.clone
output_grid = solving_sudoku(t, n_ini)
9.times do |x|
  9.times do |y|
    output[x][y] = output_grid[0][[x,y]][0]
  end
end

#Insert here test for grid conformity
# 3 primary rules

output_name = "output_grid_#{Time.now}"
grid_generator(output_name, output)
p "Solved after #{output_grid[1]} iterations, see #{output_name}.txt."

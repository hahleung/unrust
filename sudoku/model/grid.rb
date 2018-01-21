input_example = [
  ['x', 'x', 'x', 'x', 7, 'x', 'x', 'x', 'x'],
  ['x', 'x', 'x', 'x', 'x', 'x', 9, 'x', 1],
  ['x', 'x', 8, 1, 'x', 'x', 2, 4, 3],
  ['x', 'x', 9, 'x', 'x', 5, 'x', 2, 'x'],
  [2, 'x', 'x', 'x', 'x', 7, 'x', 'x', 8],
  ['x', 'x', 'x', 6, 4, 'x', 'x', 5, 'x'],
  ['x', 2, 4, 'x', 'x', 'x', 'x', 'x', 'x'],
  ['x', 'x', 1, 7, 'x', 4, 'x', 'x', 5],
  ['x', 5, 6, 'x', 9, 'x', 'x', 1, 'x']
]

module Model
  class Grid
    def self.from_input(input)
      main_grid = input.map do |col|
        col.map do |elem|
          elem == 'x' ? (1..9).to_a : [elem.to_i]
        end
      end

      position = (1..9).to_a.repeated_permutation(2).to_a
      initial_grid = position.reduce({}) do |acc, ite|
        acc.merge(ite => main_grid[ite.first - 1][ite.last - 1])
      end
    end
  end
end

p Model::Grid.from_input(input_example)

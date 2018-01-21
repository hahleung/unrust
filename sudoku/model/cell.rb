module Model
  class Cell
    attr_reader :abscissa, :ordinate

    def initialize(abscissa, ordinate)
      @abscissa = abscissa
      @ordinate = ordinate
    end

    def subgrid
      horizontal = case @abscissa
                   when 1..3
                     [1, 2, 3]
                   when 4..6
                     [4, 5, 6]
                   when 7..9
                     [7, 8, 9]
                   end

      vertical = case @ordinate
                 when 1..3
                   [1, 4, 7]
                 when 4..6
                   [2, 5, 8]
                 when 7..9
                   [3, 6, 9]
                 end

      (horizontal & vertical).first
    end
  end
end

p Model::Cell.new(9, 1).subgrid

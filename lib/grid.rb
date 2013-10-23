require_relative 'cell'

class Grid

  def initialize puzzle
    @puzzle = string_to_integer_arrays puzzle
  end

  def puzzle
    @puzzle
  end

  def string_to_integer_arrays puzzle
    puzzle = puzzle.scan(/./)
    puzzle = puzzle.map { |number| number.to_i }
    puzzle = puzzle.each_slice(9).to_a
    @puzzle = puzzle
    cell_creator
  end

  def cell_creator
    @puzzle = @puzzle.map do |array|
      array.map { |number| Cell.new number }
    end
  end

  def row number
    @puzzle[number]
  end

  def column number
    column = []
    @puzzle.each { |array| column << array[number] }
    column
  end

end
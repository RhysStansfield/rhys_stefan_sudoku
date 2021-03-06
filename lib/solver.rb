require_relative 'grid'

class Solver

  attr_reader :puzzle
  attr_reader :puzzle_grid

  def initialize
    @puzzle = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
    @puzzle_grid = Grid.new @puzzle
  end

  def grid
    @puzzle_grid.puzzle
  end

  def all_items
    grid.flatten
  end

  def grid_row number
    grid[number]
  end

  def grid_column number
    puzzle_grid.column number
  end

  def grid_box number
    puzzle_grid.check_box number
  end

  def grid_row_values number
    puzzle_grid.row_values number
  end

  def grid_column_values number
    puzzle_grid.column_values number
  end

  def grid_box_values number
    puzzle_grid.box_values number
  end

  def grid_rows
    grid
  end

  def grid_columns
    @puzzle_grid.columns
  end

  def grid_boxes
    @puzzle_grid.boxes
  end

  def iterate_rows
    number = 1
    grid_rows.each do |row|
      row.each do |cell|
        cell.candidates.delete_if do |candidate|
          grid_row_values(number).include? candidate
        end
      end
      number += 1
    end
  end

  def iterate_columns
    number = 1
    grid_columns.each do |column|
      column.each do |cell|
        cell.candidates.delete_if do |candidate|
          grid_column_values(number).include? candidate
        end
      end
      number += 1
    end
  end

  def iterate_boxes
    number = 1
    grid_boxes.each do |box|
      box.each do |cell|
        cell.candidates.delete_if do |candidate|
          grid_box_values(number).include? candidate
        end
      end
      number += 1
    end
  end

  def apply_changes
    all_items.each { |cell| cell.ready_to_assign }
  end

  def check_candidates
    all_items.map { |cell| cell.candidate_count > 1 }
  end

  def solved?
    return false if check_candidates.include? true
    true
  end

  def to_s
    back_to_string = ""
    all_items.each { |cell| back_to_string << cell.value.to_s }
    back_to_string
  end

  def solve
    return if solved?
    iterate_rows
    iterate_columns
    iterate_boxes
    apply_changes
    solve
  end

end
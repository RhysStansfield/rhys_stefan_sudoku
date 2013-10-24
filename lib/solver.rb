require_relative 'grid'

class Solver

  attr_reader :grid_to_solve

  def initialize
    puzzle = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
    @grid_to_solve = Grid.new puzzle
  end

  def grid
    grid_to_solve.puzzle
  end

  def all_items
    grid_to_solve.puzzle.flatten
  end

  def all_items_values
    values = []
    all_items.each { |cell| values << cell.value }
    values
  end

  def grid_row number
    grid[number]
  end

  def grid_columns number
    grid_to_solve.column number
  end

  def grid_box number
    grid_to_solve.check_box number
  end

  def row_values number
    grid_to_solve.row_values number
  end

  def column_values number
    grid_to_solve.column_values number
  end

  def box_values number
    grid_to_solve.box_values number
  end

  def grid_columns
    grid_to_solve.columns
  end

  def grid_boxes
    grid_to_solve.boxes
  end

  def iterate_rows
    number = 1
    candidate_destroyer = grid.each do |row|
      row.each do |item|
        unless item.candidates == nil
          item.candidates.delete_if do |candidate|
            row_values(number).include? candidate
          end
        end
      end
      number += 1
    end
  end

  def iterate_columns
    number = 1
    grid_columns.each do |column|
      column.each do |item|
        unless item.candidates == nil
          item.candidates.delete_if do |candidate|
            column_values(number).include? candidate
          end
        end
      end
      number += 1
    end
  end

  def iterate_boxes
    number = 1
    grid_boxes.each do |box|
      box.each do |item|
        unless item.candidates == nil
          item.candidates.delete_if do |candidate|
            box_values(number).include? candidate
          end
        end
      end
      number += 1
    end
  end

  # def solve


end
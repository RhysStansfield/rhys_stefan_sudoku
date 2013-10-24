require 'solver'

describe Solver do

  let(:solver) { Solver.new }

  it 'is a class called solver' do
    expect(solver.class).to be Solver
  end

  it 'is created with a sudoku puzzle' do
    expect(solver.puzzle).to eq '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  end

  it 'is created with a grid' do
    expect(solver.puzzle_grid).to be_a_kind_of Grid
  end

  it 'can access the grid' do
    expect(solver.grid).to be_a_kind_of Array
  end

  it 'has a grid made up of 9 items' do
    expect(solver.grid.count).to eq 9
  end

  it 'has a grid made up of arrays' do
    expect(solver.grid.first).to be_a_kind_of Array
  end

  it 'checks each row has 9 cells' do
    expect(solver.grid.first.count).to eq 9
  end

  it 'has a grid made up of cells' do
    expect(solver.grid.first.first).to be_a_kind_of Cell
  end

  it 'can return a row of 9 cells' do
    expect(solver.grid_row(1)).to be_a_kind_of Array
    expect(solver.grid_row(1).count).to eq 9
    expect(solver.grid_row(1).first).to be_a_kind_of Cell
  end

  it 'can return an column of 9 cells' do
    expect(solver.grid_column(1)).to be_a_kind_of Array
    expect(solver.grid_column(1).count).to eq 9
    expect(solver.grid_column(1).first).to be_a_kind_of Cell
  end

  it 'can return a box of 9 cells' do
    expect(solver.grid_box(1)).to be_a_kind_of Array
    expect(solver.grid_box(1).count).to eq 9
    expect(solver.grid_box(1).first).to be_a_kind_of Cell
  end

  it 'can return the values of a row' do
    expect(solver.grid_row_values(1)).to eq [0, 1, 5, 0, 0, 3, 0, 0, 2]
  end

  it 'can return the values of a column' do
    expect(solver.grid_column_values(1)).to eq [0, 0, 2, 4, 5, 0, 9, 8, 0]
  end

  it 'can return the values of a box' do
    expect(solver.grid_box_values(1)).to eq [0, 1, 5, 0, 0, 0, 2, 7, 0]
  end

  it 'returns all 9 rows' do
    expect(solver.grid_rows.count).to eq 9
  end

  it 'returns all 9 columns' do
    expect(solver.grid_columns.count).to eq 9
  end

  it 'returns all 9 boxes' do
    expect(solver.grid_boxes.count).to eq 9
  end

  it 'iterates on rows' do
    expect(solver.grid_rows).to receive(:each)
    solver.iterate_rows
  end

  # it 'iterates on columns' do
  #   expect(solver.grid_columns.first).to receive(:each) 
  #   solver.iterate_columns
  # end

  # it 'iterates on boxes' do
  #   expect(solver.grid_boxes).to receive(:each)
  #   solver.iterate_boxes
  # end

  it 'can view all cells' do
    expect(solver.all_items.count).to eq 81
  end

  it 'all items are cells' do
    expect(solver.all_items.first).to be_a_kind_of Cell
  end

  it 'can apply value changes to cells that can only be one thing' do
    expect(solver.all_items.first).to receive(:ready_to_assign)
    solver.apply_changes
  end

  # it 'can check whether any items still have possible candidates' do
  #   expect(solver.all_items.first.candidates).to receive(:candidate_count)
  #   solver.check_candidates
  # end

  it 'can tell if its solved' do
    expect(solver.solved?).to be_false
  end

  it 'can return the puzzle as a string' do
    expect(solver.to_s).to eq '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  end

  it 'can solve a sudoku' do
    expect(solver.solved?).to be_false
    solver.solve
    expect(solver.solved?).to be_true
    expect(solver.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
  end

end
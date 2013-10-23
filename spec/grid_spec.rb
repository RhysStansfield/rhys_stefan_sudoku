require 'grid'

describe Grid do

  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:grid) { Grid.new puzzle }
  
  it 'is of class Grid' do
    expect(grid.class).to be Grid
  end

  it 'is created with an array' do
    expect(grid.puzzle).to be_a_kind_of Array
  end

  it 'is created with a collection of 9 things' do
    expect(grid.puzzle.count).to eq 9
  end

  it 'each of the items in the collection is another collection' do
    expect(grid.puzzle.first).to be_a_kind_of Array
  end

  it 'populates each of those collections with 9 things' do
    expect(grid.puzzle.first.count).to eq 9
  end

  it 'populates the collections with a string of numbers' do
    expect(grid.puzzle.first.first.value).to eq 0
  end

  it 'puts a number into a cell' do
    expect(grid.puzzle.first.first).to be_a_kind_of Cell
  end

  it 'can return a row' do
    expect(grid.row(1)).to be_a_kind_of Array
  end 

  it 'the row is made of 9 items' do
    expect(grid.row(1).count).to eq 9
  end

  it 'the row is made up of cells' do
    expect(grid.row(1).first).to be_a_kind_of Cell
  end

  it 'can return a column' do
    expect(grid.column(1)).to be_a_kind_of Array
  end

  it 'the column is made of 9 items' do
    expect(grid.column(1).count).to eq 9
  end

  it 'the row is made up of cells' do
    expect(grid.column(1).first.class).to be Cell
  end

end
require 'cell'

describe Cell do

  let(:cell) { Cell.new 0 }

  it 'is a class called cell' do
    expect(cell.class).to eq Cell
  end

  it 'if not filled in has a value of zero' do
    expect(cell.value).to be 0
  end

  it 'may have an initival value 9' do
    cell = Cell.new 9
    expect(cell.value).to be 9
  end

  it 'empty cell has an an array' do
    expect(cell.candidates).to be_a_kind_of Array
  end

  it 'empty cell starts off with an array of 9 items' do
    expect(cell.candidates.count).to be 9
  end

  it 'filled cell has an empty array' do
    cell = Cell.new 4
    expect(cell.candidates).to eq []
  end

  it 'can tell when candidates has 5 values' do
    cell.candidates.delete_if { |num| num > 5 }
    expect(cell.candidate_count).to eq 5
  end

  it 'can tell when candidates has been reduced to a single value' do
    cell.candidates.delete_if { |num| num > 1 }
    expect(cell.candidate_count).to eq 1
  end

  it 'assigns the last remaining item in candidates to value' do
    cell.candidates.delete_if { |num| num < 9 }
    cell.ready_to_assign
    expect(cell.value).to be 9
  end

end
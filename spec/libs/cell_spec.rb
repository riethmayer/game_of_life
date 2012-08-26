require_relative '../../lib/cell'

describe Cell do
  context 'living' do
    subject      { Cell.new("x") }
    its(:dead?)  { should be_false }
    its(:alive?) { should be_true }
  end

  context 'dead' do
    subject      { Cell.new(".") }
    its(:dead?)  { should be_true }
    its(:alive?) { should be_false }
  end

  it 'should raise argument errors for invalid cells' do
    expect {
      Cell.new("foo")
    }.to raise_error(ArgumentError)
  end
end

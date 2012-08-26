require_relative '../../lib/game_of_life'

describe GameOfLife do
  let(:game_field) { [["x", "x", "x"],
                      ["x", ".", "x"],
                      ["x", "x", "x"]] }
  subject { GameOfLife.new(game_field) }
  its(:game_field) { should == game_field }

  it 'should raise no error on evolve' do
    subject.evolve
  end

  describe :cell_at do
    it 'locates properly' do
      subject.cell_at(0,0).should == Cell.new("x")
      subject.cell_at(1,1).should == Cell.new(".")
      subject.cell_at(1,2).should == Cell.new("x")
    end

    it 'raises an index error if accessing out of bounds cells' do
      expect { subject.cell_at(-1,0) }.to raise_error(IndexError)
      expect { subject.cell_at(3,0)  }.to raise_error(IndexError)
      expect { subject.cell_at(0,4)  }.to raise_error(IndexError)
      expect { subject.cell_at(0,-2) }.to raise_error(IndexError)
    end
  end
end

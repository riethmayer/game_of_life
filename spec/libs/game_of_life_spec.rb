require_relative '../../lib/game_of_life'

describe GameOfLife do
  let(:game_field) { [["x", "x", "x"],
                      ["x", ".", "x"],
                      ["x", "x", "x"]] }
  subject { GameOfLife.new(game_field) }
  its(:game_field) { should == game_field }
end

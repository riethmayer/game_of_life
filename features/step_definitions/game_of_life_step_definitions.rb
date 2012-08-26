Given /^the following setup$/ do |table|
  @game = GameOfLife.new(table.raw)
end

When /^the game evolves$/ do
  @game.evolve
end

Then /^the center cell should be dead$/ do
  @game.cell_at(1,1).should be_dead
end

Then /^the center cell should be alive$/ do
  @game.cell_at(1,1).should be_alive
end

Then /^the board should look like this$/ do |table|
  @game.game_field.should == table.raw
end

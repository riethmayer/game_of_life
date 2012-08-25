Given /^the following setup$/ do |table|
  @game = GameOfLife.new(table.raw)
end

When /^the game evolves$/ do
  @game.evolve
end

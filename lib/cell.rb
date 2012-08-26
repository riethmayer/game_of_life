class Cell
  attr_reader :cell

  def initialize(str)
    raise ArgumentError unless ["x","."].include?(str)
    @cell = str
  end

  def dead?
    @cell == "."
  end

  def alive?
    @cell == "x"
  end

  def ==(other)
    other.cell == @cell
  end
end

require 'cell'
class GameOfLife
  attr_accessor :game_field

  def initialize(game_field)
    @game_field = game_field
  end

  def evolve
    @new_game_field = []
    @game_field.each_with_index do |row,x|
      @new_game_field[x] ||= []
      row.each_with_index do |cell,y|
        population = living_neighbours(x,y)
        if Cell.new(cell).dead?
          if population == 3
            @new_game_field[x][y] = "x"
          elsif population > 3 || population < 2
            @new_game_field[x][y] = "."
          else # == 2
            @new_game_field[x][y] = "."
          end
        else
          if population == 3 || population == 2
            @new_game_field[x][y] = "x"
          else
            @new_game_field[x][y] = "."
          end
        end
      end
    end
    @game_field = @new_game_field
  end

  def living_neighbours(row,column)

    values = {
      top_left:     [-1,-1],
      top_right:    [-1,1],
      bottom_left:  [1,-1],
      bottom_right: [1,1],
      left: [-1,0],
      right: [1,0],
      top: [0,-1],
      bottom: [0,1]
    }.values
    puts values.to_s
    sum = 0
    values.each do |pair|
      if neighbour_alive?(pair.first, pair.last)
        sum += 1
      end
    end
    sum
  end
  private :living_neighbours

  def neighbour_alive?(x,y)
    c = @game_field[x] && @game_field[x][y]
    c && Cell.new(c).alive?
  rescue  ArgumentError
    false
  rescue IndexError
    false
  end
  private :neighbour_alive?

  def cell_at(x,y)
    raise IndexError if x < 0 || y < 0
    cell = @game_field[x] && @game_field[x][y]
    raise IndexError,"#{x},#{y},#{cell},#{@game_field}" if cell.nil? || cell.empty?
    Cell.new(cell)
  end
end

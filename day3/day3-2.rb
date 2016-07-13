require 'ostruct'

class CountHouses

  def initialize()
    @houses = 0
    @gifted_homes = []
    @santa_current, @robo_current = OpenStruct.new, OpenStruct.new
    init_coordinates()
    add_house(santa_current)
  end

  def count_houses(path)
    turn = :robo
    path.chars.each do |move|
      turn = swap_turn(turn)
      current_house = process_symbol(move, get_house(turn))
      add_house(current_house) unless (gifted_homes.include?(current_house))
      update_house(turn, current_house)
    end
    houses
  end

  private

  attr_reader :gifted_homes, :santa_current, :robo_current, :houses

  def swap_turn(turn)
    turn == :robo ? :santa : :robo
  end

  def get_house(turn)
    turn == :santa ? santa_current : robo_current
  end

  def update_house(turn, current_house)
    @santa_current = current_house if turn == :santa
    @robo_current = current_house if turn == :robo
  end

  def process_symbol(symbol, current_house)
    case symbol
    when "^"
      current_house.y += 1
    when "<"
      current_house.x -= 1
    when ">"
      current_house.x += 1
    when "v"
      current_house.y -= 1
    else
      throw "symbol not expected"
    end
    current_house
  end

  def add_house(coordinate)
    gifted_homes << coordinate.dup
    @houses += 1
  end

  def init_coordinates()
    @santa_current.x, @santa_current.y = 0, 0
    @robo_current.x, @robo_current.y = 0, 0
  end
end


=begin

require 'benchmark'

  MEASUREMENT PERFORMANCE OF PROGRAM

  def measure_time(path)
    time = Benchmark.realtime do
      result = count_houses(path)
      puts "Result: #{result}"
    end
    puts "Time elapsed: #{time} seconds"
  end


=end
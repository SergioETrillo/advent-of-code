require 'ostruct'

class CountHouses

  attr_reader :houses

  def initialize()
    @houses = 0
    @gifted_homes = []
    @current_house = OpenStruct.new
    @current_house.x = 0
    @current_house.y = 0
    add_house(current_house)
  end

  def process_symbol(symbol)
    case symbol
    when "^"
      @current_house.y += 1
    when "<"
      @current_house.x -= 1
    when ">"
      @current_house.x += 1
    when "v"
      @current_house.y -= 1
    else
      throw "symbol not expected"
    end
  end

  def add_house(coordinate)
    gifted_homes << coordinate.dup
    @houses += 1
  end

  def count_houses(path)
    path.chars.each do |move|
      process_symbol(move)
      add_house(current_house) unless (gifted_homes.include?(current_house))
    end
    houses
  end


  private

  attr_reader :gifted_homes, :current_house
end
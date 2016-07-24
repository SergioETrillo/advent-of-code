class Day6

  attr_reader = :lighted

  def initialize
    @lighted = 0
    @grid = Array.new(1000) {Array.new(1000,0)}
  end

  def get_raw_data
    data = File.read("input.txt")
    lines = data.split("\n")
  end

  def get_instruction(line)
    words = line.split(/\W+/)
    if words.count == 6
      result = { command: words[0],
                 x_beg: words[1].to_i, y_beg: words[2].to_i,
                 x_end: words[4].to_i, y_end: words[5].to_i }
    else
      result = { command: words[1],
                 x_beg: words[2].to_i, y_beg: words[3].to_i,
                 x_end: words[5].to_i, y_end: words[6].to_i }
    end
  end

  def execute_line(line)
    case line[:command]
    when "toggle"
      process_toggle(line)
    when "on"
      process_on(line)
    when "off"
      process_off(line)
    else
      raise "error in line instructions"
  end

  private

  def process_toggle(line)
    for i in line[:x_beg]..line[:x_end]
      for j in line[:y_beg]..line[:y_end]
        @grid[i][j] == 1 ? @grid[i][j] = 0 : @grid[i][j] = 1
      end
    end
  end

  def sum(ary)
    lighted = 0
    ary.each do |line|
      lighted += line.inject(:+)
    end
    lighted
  end

end

class Day6

  attr_reader = :lighted

  def initialize
    @grid = Array.new(1000) {Array.new(1000,0)}
    @lighted = 0
  end

  def get_raw_data
    data = File.read("input.txt")
    lines = data.split("\n")
  end

  def calculate_lights(lines)
    lines.each do |line|
      instruction = get_instruction(line)
      update_grid(instruction)
    end
    sum(@grid)
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

   private

   def update_grid(instruction)
    command = instruction[:command]
    for i in instruction[:x_beg]..instruction[:x_end]
      for j in instruction[:y_beg]..instruction[:y_end]
        process_command(command,i,j)
      end
    end
  end

  def process_command(command,i,j)
    case command
    when "toggle"
      @grid[i][j] == 1 ? @grid[i][j] = 0 : @grid[i][j] = 1
    when "on"
      @grid[i][j] = 1
    when "off"
      @grid[i][j] = 0
    else
      raise "command error"
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

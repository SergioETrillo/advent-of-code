class Day7

  attr_reader :lines

  def get_raw_data
    data = File.read("lib/input.txt")
    @lines = data.split("\n")
  end

  def reverse_data
    @lines.map do |line|
      reverse(line)
    end
    lines
  end

  def reverse(line)
    line.split("->").reverse
  end


end
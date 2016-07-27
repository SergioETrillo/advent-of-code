class Day7

  attr_accessor :lines

  def initialize
    data = File.read("lib/input.txt")
    @lines = data.split("\n")
  end

  def reverse_data
    @lines.map! { |line| reverse(line) }
  end

  def reverse(line)
    line.split("->").reverse
  end

  def sort_file
    lines.sort_by!{|e| [e[0].length, e[0]]}

  end

  def trim
    lines.map!{ |e| [e[0].strip, e[1].strip] }
  end

  def convert_to_hash
     @lines = lines.to_h
  end

  def process_signals
    result_key, result_value = lines.first


  end
end
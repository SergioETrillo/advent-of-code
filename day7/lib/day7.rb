class Day7

  attr_accessor :lines

  def initialize
    # data = File.read("lib/input.txt")
    data = File.read("spec/test.txt")
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
    lines.delete(result_key)
    lines.each do |key,value|
      process_instruction(key,value)
      return lines[result_key] if lines[result_key].is_a? Fixnum
    end
  end

  def process_instruction(key,value)
    val_ary = value.split
    if val_ary.length == 1
      lines[key] = value.to_i
    else
      result = process_logic_function(val_ary)
      lines[key] = result
    end
  end

  def process_logic_function(ary)
    result = ""
    if ary[0] == "NOT"
      result = (2^16 - ~lines[ary[1]])
    else
      result = and_or_rlshift(ary)
    end
    result
  end

  def and_or_rlshfit(ary)
    result = ""
    operator1, logic_function, operator2  = ary

    case logic_function
    when "AND"
      result = lines[operator1] & lines[operator2]
    when "OR"
      result = lines[operator1] | lines[operator2]
    when "RSHIFT"
      result = lines[operator1] >> operator2.to_i
    when "LSHIFT"
      result = lines[operator1] << operator2.to_i
    else
      raise "error"
    end
    result
  end
end
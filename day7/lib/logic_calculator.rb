class LogicCalculator

  attr_accessor :lines

  def initialize
    data = File.read("lib/input.txt")
    @lines = data.split("\n")
  end

  def calculate_result
    reverse_data
    sort_file
    trim
    convert_to_hash
    result = process_signals
  end

  def print_result
    puts "result is: #{calculate_result}"
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
      return lines[result_value] if lines[result_value].is_a? Fixnum
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
      result = _not(lines[ary[1]])
    else
      result = and_or_rlshift(ary)
    end
    result
  end

  def _not(number)
    (2**16 + ~number)
  end

  def and_or_rlshift(ary)
    result = ""
    value1, logic_function, value2  = provide_ops_values(ary)
    calc_logic(value1,logic_function,value2)
  end

  def calc_logic(value1,logic_function,value2)
    case logic_function
    when "AND"
      result = value1 & value2
    when "OR"
      result = value1 | value2
    when "RSHIFT"
      result = value1 >> value2
    when "LSHIFT"
      result = value1 << value2
    else
      raise "error"
    end
    result
  end

  def provide_ops_values(ary)
    operator1, logic_function, operator2  = ary
    value1, value2 = select_value(operator1), select_value(operator2)
    [value1, logic_function, value2]
  end

  def select_value(op)
    regex_nb = /^[0-9]+$/
    value = regex_nb =~ op ? op.to_i : lines[op]
  end
end
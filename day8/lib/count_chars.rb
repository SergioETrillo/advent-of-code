class CountChars

  attr_reader :list_strings

  def get_data
    file = File.read("lib/data.txt")
    @list_strings = file.split("\n")
  end

  def calculate_result
    calc_string_literal - calc_string_escaped
  end

  def calc_string_literal
    literal = 0
    list_strings.each { |row| literal += row.length}
    literal
  end

  def calc_string_escaped
    escaped = 0
    list_strings.each do |row|
      row.each_char { |c| escaped += 1 }
    end
    escaped
  end
end

# each_char and check if "\"" if "\\" or if "\x" then check if next to chars are hexa, if those then add the relevant number of chars to the "literal"
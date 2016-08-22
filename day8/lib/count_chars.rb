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
    list_strings.each do |row|
      row.chomp!
      literal += row.length
    end
    literal
  end

  def calc_string_escaped
    escaped = 0
    list_strings.each do |row|
      row = row[1..-2]
      row = row.gsub(/\\x[a-fA-F0-9]{2}/, '\'').gsub(/\\"/, '"').gsub(/\\\\/, '\\')
      escaped += row.length - 2
    end
    escaped
  end
end

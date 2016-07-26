class Day7

  attr_reader :test

  def get_data
    data = File.read("lib/input.txt")
    lines = data.split("\n")
  end

end
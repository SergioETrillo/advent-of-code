class Zone

  attr_reader :x_start, :x_end,  :y_start,:y_end

  def initialize(x_start, y_start, x_end, y_end)
    @x_start = x_start
    @x_end = x_end
    @y_start = y_start
    @y_end = y_end
  end

  def calculate_on
    (x_end - x_start).abs * (y_end - y_start).abs
  end



end
module Explorer
  class Plateau

    def initialize(x_max, y_max)
      @x_min = 0
      @y_min = 0
      @x_max = x_max
      @y_max = y_max
    end

    def can_i_move_to?(x, y)
      x >= @x_min && x <= @x_max && y >= @y_min && y <= @y_max
    end

  end
end
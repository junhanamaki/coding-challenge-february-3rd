module Explorer
  class Rover

    NEW_DIRECTION_MAP = {
      "L" => { "N" => "W", "W" => "S", "S" => "E", "E" => "N" },
      "R" => { "N" => "E", "E" => "S", "S" => "W", "W" => "N" }
    }

    def initialize(plateau, initial_x, initial_y, initial_direction)
      @plateau = plateau
      @current_x = initial_x
      @current_y = initial_y
      @current_direction = initial_direction
    end

    def explore(instructions)

    end


  end
end
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

    def current_coordinates
      "#{@current_x} #{@current_y} #{@current_direction}"
    end

    def process_instructions_and_report_coordinates!(instructions, raise_errors = false)
      process_instructions!(instructions, raise_errors)

      current_coordinates
    end

    def process_instructions!(instructions, raise_errors = false)
      instructions.each_char do |instruction|
        process_instruction!(instruction, raise_errors)
      end
    end

    def process_instruction!(instruction, raise_errors = false)
      case instruction
      when "L", "R"
        update_direction!(instruction)
      when "M"
        move_forward!
      else
        raise "unknown instruction beep beep!" if raise_errors
      end
    end

    def update_direction!(instruction)
      @current_direction = NEW_DIRECTION_MAP[instruction][@current_direction]
    end

    def move_forward!
      new_x = @current_x
      new_y = @current_y

      case @current_direction
      when "N"
        new_y += 1
      when "S"
        new_y -= 1
      when "E"
        new_x += 1
      when "W"
        new_x -= 1
      end

      if @plateau.movable_coordinate?(new_x, new_y)
        @current_x = new_x
        @current_y = new_y
      end
    end

  end
end
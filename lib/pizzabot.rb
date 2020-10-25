# require "pizzabot/version"

module Pizzabot
  # This is pizza delivery robot
  class DeliveryRobot
    MOVE_NORTH = 'N'
    MOVE_SOUTH = 'S'
    MOVE_EAST = 'E'
    MOVE_WEST = 'W'
    DROP_PIZZA = 'D'
    attr_reader :string, :coordinates, :x, :y, :grid, :instruction_string

    def initialize(string)
      @string = string.delete(' ') # assign string without empty spaces
      @coordinates = @string.scan(/\d+[,]\d+/) # take out coordinates with regex
      @x = 0 # start position
      @y = 0 # start position
      @grid = @string.scan(/\d+[x]\d+/).join('') # take out grid size with regex
      @instruction_string = '' # string with delivery instructions
    end

    def delivery
      return 'Invalid grid size!' unless @grid.include?('x') && @grid.length == 3 # check for valid grid size input

      condition = instructions
      condition.nil? || @coordinates == [] ? 'Invalid coordinates!' : condition # check for valid coordinates, then return instruction string
    end

    private

    def instructions
      @coordinates.each do |house| # passes all coordinates
        next if house == '0,0' # skip house if coordinates is equal with start position

        x1 = @x # assign current house point for x
        y1 = @y # assign current house point for y
        @x = house.split(',').first.to_i # assign next house point for x
        @y = house.split(',').last.to_i # assign next house point for y
        in_range ? @instruction_string += delivery_check(x1, y1) : @instruction_string = nil # condition for instruction string
        break if @instruction_string.nil? # stop with passing and return nil
      end
      @instruction_string # returns string with instructions
    end

    def in_range
      @x <= grid_x_axis && @y <= grid_y_axis # check coordinates are in grid range
    end

    def delivery_check(arg1, arg2)
      @x.positive? || @y.positive? ? x_move(@x - arg1) + y_move(@y - arg2) + DROP_PIZZA : '' # if x and y are positive add x moves, y moves and 'D' to instruction string or add empty string ''
    end

    def grid_x_axis
      @grid.split(',').first.to_i # return x axis
    end

    def grid_y_axis
      @grid.split(',').last.to_i # return y axis
    end

    def x_move(arg_x)
      x_moves = ''
      arg_x.abs.times { x_moves += arg_x.positive? ? MOVE_EAST : MOVE_WEST } # x times 'E' or 'W'
      x_moves
    end

    def y_move(arg_y)
      y_moves = ''
      arg_y.abs.times { y_moves += arg_y.positive? ? MOVE_NORTH : MOVE_SOUTH } # y times 'N' or 'S'
      y_moves
    end
  end
end

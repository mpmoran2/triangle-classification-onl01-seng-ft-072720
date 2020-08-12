require 'pry'

class Triangle
  attr_accessor :sX, :sY, :sZ, :sides

  def initialize(sX, sY, sZ)
    @sX = sX
    @sY = sY
    @sZ = sZ
    @sides = [sX, sY, sZ]
  end

  def kind
    if valid_triangle? != true
    raise TriangleError
    else
      if valid_tri? == true && ((@sides[0] == @sides[1]) && (@sides[0] == @sides[2]))
        :equilateral
      elsif valid_tri? == true && ((@sides[0] == @sides [1]) || (@sides[0] == @sides [2]) || (@sides[1] == @sides [2]))
        :isosceles
      elsif valid_tri? == true && @sides.uniq == @sides
        :scalene
      end
    end
  end 

  class TriangleError < StandardError
    def error_msg
      puts "This is no triangle!"
    end 
  end
end


#Define :equilateral :isosceles :scalene
require 'pry'

class Triangle
  attr_accessor :sX, :sY, :sZ, :sides #pathagrium sides. x,y,z

  def initialize(sX, sY, sZ)
    @sX = sX
    @sY = sY
    @sZ = sZ
    @sides = [sX, sY, sZ]
  end

  def kind #make it easy, use self more like been doing. self is your friend
    if self.invalid? #make sure to define what invalid is
        raise TriangleError
    elsif self.equilateral?
      :equilateral
    elsif self.isosceles?
      :isosceles
    elsif self.scalene?
      :scalene
    end
  end
  
  def invalid? #if it flags any of this, get the error.
    if (self.sides.any?{ |side| side <= 0} || self.side1 + self.side2 <= side3 ||
      self.side2 + self.side3 <= side1 || self.side3 + self.side1 <= side2)
      true 
    end
  end
  
  #so what is a valid triangle?
  
  def equilateral?
    true if sides.uniq.count == 1
  end

  def isosceles?
    true if sides.uniq.count == 2
  end

  def scalene?
    true if sides.uniq.count == 3
  end
  #^^^tried to put them in one def but it didnt flag the pass? need to figure out if I was using the elsif correctly? will mess in repl more but this got the pass so...smells cody a bit but pass is pass 
  
  class TriangleError < StandardError
    def error_msg
      puts "This is no triangle!"
    end 
  end
end


#Define :equilateral :isosceles :scalene
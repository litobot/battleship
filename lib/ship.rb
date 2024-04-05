class Ship

  attr_reader :name, 
              :length, 
              :health
  
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    @health == 0
  end

  def hit
    @health -= 1
  end #This method is returning  a value to the console in pry when it is called. when it shouldnt for some reason
end
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def dock(bike)
    fail 'Van Full' if @bikes.length >= @capacity
    @bikes << bike
    nil
  end

  def release_bike
    fail 'Van Empty' if @bikes.empty?
    nil
  end

  def return_bike
    fail 'Van Empty' if @bikes.empty?
  end
end

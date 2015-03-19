require_relative 'bike'

class DockingStation
  def dock bike
    fail 'Station Full' if @bike
    @bike = bike
  end

  def release_bike
    fail 'No Bikes Available' unless @bike
    @bike
  end
end

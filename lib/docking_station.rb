require_relative 'bike'

class DockingStation
  attr_writer :capacity
  attr_reader :bikes
  def initialize
    @bikes = []
    @capacity = 20
  end

  def dock bike
    fail 'Station Full' if full?
    bikes << bike
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    bikes.pop
  end

  def release_broken_bikes
    @bikes.each do |b|
      thing = b.select(&:broken?)
      thing
    end
  end

  private

  def empty?
    bikes.reject(&:broken?).length == 0
  end

  def full?
    bikes.length >= @capacity
  end
end

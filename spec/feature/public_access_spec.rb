require 'capybara/rspec'
require 'docking_station'
feature 'member of public acceses bike' do
  scenario 'docking station releases a bike that is not broken' do
    docking_station = DockingStation.new
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end
  scenario 'docking station does not release when bikes are not avaliable' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end
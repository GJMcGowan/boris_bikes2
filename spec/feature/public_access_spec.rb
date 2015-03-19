require 'capybara/rspec'
require 'docking_station'
feature 'member of public acceses bike' do
  let(:docking_station) { DockingStation.new }
  scenario 'docking station releases a bike that is not broken' do
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end
  scenario 'docking station does not release when bikes are not avaliable' do
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
  scenario 'docking station will not make broken bikes available' do
    broken_bike = Bike.new
    broken_bike.break
    docking_station.dock broken_bike
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end

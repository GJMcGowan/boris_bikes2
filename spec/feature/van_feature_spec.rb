require 'docking_station'

feature 'vans can hold bikes' do
  scenario 'van unable to hold a bike' do
    van = Van.new
    20.times { van.dock Bike.new }
    expect { van.dock Bike.new }.to raise_error 'Van Full'
  end
  scenario 'van can release any bike' do
    van = Van.new
    bike = Bike.new
    van.dock bike
    expect(van.release_bike).to be nil
  end
  scenario 'van is empty' do
    van = Van.new
    expect { van.release_bike }.to raise_error 'Van Empty'
  end
end
feature 'vans can return bikes to docking station' do
  scenario 'try to return bike, but van is empty' do
    van = Van.new
    expect { van.return_bike(nil) }.to raise_error 'Van Empty'
  end
  scenario 'van returns bike to docking station' do
    van = Van.new
    bike = Bike.new
    docking_station = DockingStation.new
    van.dock bike
    van_before_unloading = van.bikes
    van.return_bike(docking_station)
    expect(docking_station.bikes).to eq van_before_unloading
  end
end

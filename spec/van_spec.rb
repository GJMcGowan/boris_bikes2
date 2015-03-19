require 'van'

describe Van do
  it { is_expected.to respond_to :dock }
  it 'can dock a bike' do
    expect(subject.dock :bike).to be nil
  end
  it 'returns an error when van is full' do
    20.times { subject.dock :bike }
    expect { subject.dock :bike }.to raise_error 'Van Full'
  end
  it 'can release a bike' do
    subject.dock :bike
    expect(subject.release_bike).to be nil
  end
  it 'returns an error when van is empty' do
    expect { subject.release_bike }.to raise_error 'Van Empty'
  end
  it 'returns an error when returning a bike to the docking station' do
    expect { subject.return_bike(nil) }.to raise_error 'Van Empty'
  end
  it { is_expected.to respond_to :return_bike }
  # it 'can return a bike to the docking station' do
  #   van = Van.new
  #   # bike = Bike.new
  #   docking_station = double :DockingStation, :bikes [bike]
  #   docking_station = DockingStation.new
  #   van.dock double :bike
  #   van_before_unloading = van.bikes
  #   van.return_bike
  #   expect(docking_station.bikes).to eq van_before_unloading
end

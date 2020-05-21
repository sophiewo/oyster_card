require 'station'

describe Station do
  it "responds to two arguments" do
    expect(Station).to respond_to(:new).with(2).arguments 
  end

  it 'stores the name of a station when initialized' do
    tube_station = Station.new("Oval", 2)
    expect(tube_station.station).to eq('Oval')
  end

  it 'stores the stations zone when initialized' do
    tube_station = Station.new("Oval", 2)
    expect(tube_station.zone).to eq(2)
  end

end
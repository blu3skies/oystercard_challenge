require 'station'

describe Station do 
  it 'should return an integer for the station zone' do 
    expect(subject.zone).to be_an(Integer)
  end
  it 'should return as String for the station name' do 
    expect(subject.name).to be_a(String)
  end
end 
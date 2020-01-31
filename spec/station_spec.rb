require 'station'

describe Station do 
  it 'should return an integer for the station zone' do 
    expect(subject.zone).to be_an(Integer)
  end 
end 
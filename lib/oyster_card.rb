class Oyster_card 
  attr_reader :balance, :en_route, :entry_station, :previous_trips
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @en_route = false
    @entry_station = nil
    @previous_trips = []
    @exit_station = nil
  end

  def top_up(amount)
    raise "Limit exceeded" if @balance + amount > 90

    @balance = @balance + amount
  end 

  def touch_in(station)
    raise 'balance too low' if @balance < MINIMUM_FARE

    @en_route = true 
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @balance -= MINIMUM_FARE
    @en_route = false
    @previous_trips.push({:entry_station => @entry_station, :exit_station => @exit_station})
    @entry_station = nil
    return station
  end

  private

  def deduct(fare)
    @balance = @balance - MINIMUM_FARE
  end    
end

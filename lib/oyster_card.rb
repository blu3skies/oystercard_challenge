class Oyster_card 
  attr_reader :balance, :en_route, :entry_station, :previous_trips
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @en_route = false
    @entry_station = nil
    @previous_trips = 'previous_trips'
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

  def touch_out
    @en_route = false
    @balance = @balance - MINIMUM_FARE
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance = @balance - MINIMUM_FARE
  end    
end
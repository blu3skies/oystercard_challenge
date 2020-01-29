class Oyster_card 

attr_reader :balance, :en_route

MINIMUM_FARE = 1

    def initialize
      @balance = 0
      @en_route = false
    end    

    def top_up(amount)
        raise "Limit exceeded" if @balance + amount > 90
        @balance = @balance + amount
    end

    def deduct(fare)
        @balance = @balance - MINIMUM_FARE
    end   

    def touch_in
        raise 'balance too low' if @balance < MINIMUM_FARE
        @en_route = true 
    end

    def touch_out
        @en_route = false
    end
    
    
end
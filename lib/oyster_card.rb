class Oyster_card 

attr_reader :balance 

MINIMUM_FARE = 1

    def initialize
      @balance = 0
    end    

    def top_up(amount)
        raise "Limit exceeded" if @balance + amount > 90
        @balance = @balance + amount
    end

    def deduct(fare)
        @balance = @balance - MINIMUM_FARE
    end    


end
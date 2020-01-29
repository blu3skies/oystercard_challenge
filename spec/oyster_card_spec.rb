require 'oyster_card'

describe Oyster_card do
    let(:station) { double :station}
    it 'should initilize the card with a balance of 0' do
        expect(subject.balance).to eq 0
    end    

    describe '#top_up' do 

        it 'should top up the card with an amount' do
            expect(subject.top_up(10)).to eq 10
        end

        it 'should raise an error if new balance exceeds limit' do
            oyster = Oyster_card.new
            oyster.top_up(90)
            expect { oyster.top_up(1) }.to raise_error("Limit exceeded")
        end

    end 

    describe '#en_route' do
    
        it 'en_route should be false' do 
            expect(subject.en_route).to eq false
        end
    end

    describe '#touch_in' do    

        it 'touch in should equal in_journey to true' do
            oyster = Oyster_card.new(10)
            oyster.touch_in('')
            expect(oyster.en_route).to eq true
        end

        it 'should raise error if balance is less than Minimum fare' do 
            expect { subject.touch_in('') }.to raise_error 'balance too low'
        end 

        it 'should remember entry station' do 
            oyster = Oyster_card.new(10)
            oyster.touch_in(station) 
            expect(oyster.entry_station).to eq station
        end
    end
     
    describe '#touch_out' do     

        it 'touch_out should equal in journey to false' do
            oyster = Oyster_card.new(10)
            oyster.touch_in('') 
            oyster.touch_out
            expect(oyster.en_route).to eq false 
        end

        it 'should minus minimum far when touching out' do
            oyster = Oyster_card.new
            oyster.top_up(10)
            oyster.touch_in('') 
            oyster.touch_out
            expect { oyster.touch_out }.to change{oyster.balance}.by(-Oyster_card::MINIMUM_FARE)
    
        end 
    end

end 


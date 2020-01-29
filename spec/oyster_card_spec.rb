require 'oyster_card'

describe Oyster_card do

    it 'should initilize the card with a balance of 0' do
        expect(subject.balance).to eq 0
    end    
      
    it 'should top up the card with an amount' do
        expect(subject.top_up(10)).to eq 10
    end

    it 'should raise an error if new balance exceeds limit' do
        oyster = Oyster_card.new
        p oyster.top_up(90)
        expect { oyster.top_up(1) }.to raise_error("Limit exceeded")
    end

    it 'should deduct fare from balance' do
        oyster = Oyster_card.new 
        p oyster.top_up(10)
        expect(oyster.deduct(1)).to eq 9
    end    
end 


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
        oyster.top_up(90)
        expect { oyster.top_up(1) }.to raise_error("Limit exceeded")
    end

end 

# name error 
# ./spec/oyster_card_spec.rb:1:in `<top (required)>'
# 1
# make a oyster card file with class oc
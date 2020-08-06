require './DiceSet'
require './Util'
describe DiceSet do
    
        it "shoud return arry from diceset roll" do
            ds = DiceSet.new
            dice = ds.roll(5)
            expect(dice.is_a?(Array)).to eq true
        end  
        it 'array is of length 5 is returned' do
            ds = DiceSet.new
            dice = ds.roll(5)
            expect(dice.length).to eq 5
        end
end


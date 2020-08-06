class DiceSet
    def initialize
    end
    def roll(n)
        @result = []
        n.times {@result.push(rand(5)+1)}
        return @result
    end
end
class Player
    attr_accessor :point
    attr_accessor :in_the_game
    def initialize
        @point = 0
        @in_the_game = false
    end
    def add_point(x)
        @point+=x
    end
    def get_point
        return @point
    end
    def in_the_game
        return @in_the_game
    end
    def set_in_the_game
        @in_the_game =true
    end

end
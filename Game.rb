require './DiceSet'
require './Util.rb'
require './Player.rb'
class Game
    attr_reader :n
    attr_accessor :round
    attr_accessor :players
    attr_accessor :dice_set
    attr_accessor :is_final_round
    def initialize(n)
        @n = n
        @round =1
        @players = []
        n.times{player =Player.new
               @players.push(player)
             }
        @dice_set  =DiceSet.new
        @is_final_round =false
    end
    def initate_each_round
        puts "Turn #{@round}:"
        @round+=1
        puts "------"
        x= 0
        while x<@n do
            #check if 3000 reached
              if(@is_final_round==false)
                @n.times do  |i| 
                  player = @players[i]
                  if player.get_point >=800
                    #REACHED INITIATE FINAL ROUND
                    puts "Player #{i+1} reached 3000 points.\n Final round starts \n ***********"
                    x=0
                    @is_final_round =true
                    break
                  end
                end
              end
          player = @players[x]
          player_point = player.get_point
          puts "Player #{x+1} points: #{player_point}"
          dice = @dice_set.roll(5)
          puts "Player #{x+1} rolls : #{dice}"
          score = score(dice)
          puts "Score in this round: #{score}"
          if player.in_the_game == false && score <300
            x+=1
             next
          end
          if player.in_the_game == false && score >=300
            puts "You are in the game"
            player.set_in_the_game
          end
          #to continue since player is in the game
          non_scoring_die = number_of_non_scoring_die(dice)
          if non_scoring_die ==0 || score == 0
            puts "0 non-scoring die, continuing to next player."
            player.add_point(score)
            x+=1
            next
          end
          print "Do you want to roll the non-scoring #{non_scoring_die} dices?(y/n): "
          c = gets.chomp
          if c=="n"
            player.add_point(score)
            puts "Total score player #{x+1}: #{player.point}"
            x+=1
            next    
          elsif
                cond = true
                while cond==true
                    dice = @dice_set.roll(non_scoring_die)
                    puts "Player #{x+1} rolls : #{dice}"
                    sco = score(dice)
                    puts "Score in this round: #{sco}"
                    if sco == 0
                        score = 0
                        cond = false
                        next
                    end
                    score+=sco
                    non_scoring_die = number_of_non_scoring_die(dice)
                    if non_scoring_die ==0
                        break
                    end
                    print "Do you want to roll the non-scoring #{non_scoring_die}  dices?(y/n): "
                    c = gets.chomp
                    if c=="n"
                        cond =false
                        next
                    end
                end
               player.add_point(score)
               puts "Total score player #{x+1}: #{player.point}"

            end #else ends
          x+=1
        end # each round 'while' loop end

        if @is_final_round ==false
            initate_each_round
        elsif
            puts "Getting winner"
        end
          
    end
    def get_winner
      index =0
      max =@players[0].get_point
      n.times do |x|
          if @players[x].get_point >max
            max = @players[x].get_point
            index =x
          end
        end
      puts "Winner is Player #{index+1}, with #{max} points"
    end

end


print "Enter number of players: "
n = gets.chomp.to_i
game = Game.new(n)
game.initate_each_round
game.get_winner
# hash = {1: 'one'} # will not work  
# hash = {1 => 'one'} # will work
require 'csv'

class Game 
  @@count_correct = 0
  @@count_error = 0

  def initialize(file)
    @file = file
    @flash_cards = CSV.read(@file, col_sep: ",").to_h
  end

  def game_loop 
    while true do
      @hash_keys = @flash_cards.keys
      if @hash_keys.empty?
        winner_message
        break
      else
        puts "You can type 'exit' and finish game in any time."
        rand_value = @hash_keys.sample
        puts"-"*20
        puts "Our next word is: #{rand_value}"
        puts "Enter your answer"

        prompt
        word = gets.chomp
        puts"-"*20

        if word == 'exit' 
          puts "bye-bye"
          break
        elsif @flash_cards[rand_value].casecmp?(word)
          puts "Correct!!!"
          @@count_correct += 1
          @flash_cards.delete @flash_cards[rand_value]
          @flash_cards.delete rand_value
        else
          puts "Wrong answer!"
          puts "Correct answer is: #{@flash_cards[rand_value].upcase}!!!"
          @@count_error += 1
        end

        puts "Total correct answers is: #{@@count_correct}"
        puts "Total wrong answers is: #{@@count_error}"

        if @@count_error == 3 
          puts "You have 3 mistakes. Game over. Try again."
          break
        end
      end
    end
  end

  private
  def prompt
    print "> "
  end

  def winner_message 
    puts"="*20
    puts "Game over. You are the winner"
    puts"="*20
  end
end

game1 = Game.new 'attachments/eng2.csv'

game1.game_loop
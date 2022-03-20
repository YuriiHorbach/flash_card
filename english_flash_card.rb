# hash = {1: 'one'} # will not work  
# hash = {1 => 'one'} # will work

class Game 

  @@flash_cards = {
    'подорожування': 'travelling',
    'фотоапарат': 'camera',
    'змінна': 'variable',
    'цикл': 'loop',
    'подорож': 'journey'
  }

  @@hash_keys = @@flash_cards.keys

  @@count_correct = 0
  @@count_error = 0

  def def initialize(file)
    @file = file
  end

  def game_loop 
    while true do
      puts "You can type 'exit' and finish game in any time."
      rand_value = @@hash_keys.sample
      puts"-"*20
      puts "Our next word is: #{rand_value}"
      puts "Enter your answer"

      prompt
      word = gets.chomp
      puts"-"*20

      if word == 'exit' 
        puts "bye-bye"
        break
      elsif @@flash_cards[rand_value].casecmp?(word)
        puts "Correct!!!"
        @@count_correct += 1
      else
        puts "Wrong answer!"
        puts "Correct answer is: #{@@flash_cards[rand_value].upcase}!!!"
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

  private
  def prompt
    print "> "
  end
end

game1 = Game.new

game1.game_loop
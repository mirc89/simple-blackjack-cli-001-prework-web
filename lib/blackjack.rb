def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(11)+1 #How to account for Aces later?..
end

def display_card_total(current_card_total)
  puts "Your cards add up to #{current_card_total.to_s}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp.downcase
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  @hand = deal_card + deal_card
  display_card_total(@hand)
  return @hand
end

def hit?
  #couldn't get these tests passing so I made code that would still make the game work.
  i = 1
  while i == 1
    prompt_user
    action = get_user_input
    if action == "s"
      i = 0
    elsif action == "h"
      @hand = deal_card + @hand
        if @hand == 21 
          success_message
          break
        elsif @hand > 21
          end_game(@hand)
          break
        end
      display_card_total(@hand)
    else
      invalid_command
    end
  end
  return @hand
end

def invalid_command
  puts "Sorry, that is an invalid command."
  # sleep(1) #here to be more user friendly in the command line.
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  welcome
  initial_round
  check_initial_hand
  hit?
end

#####################################################
# additional methods
#####################################################

def success_message
  puts "Nice! You hit 21!"
end

def check_for_aces
  #calculates whether to count an ace as high or low
end

def check_initial_hand #this is used for when initial_round returns 21/22
  if @hand == 21
    success_message
    return @hand
  elsif @hand == 22
    end_game(@hand)
    #later to be changed to:
    #@hand = 12
    #but need re-write the program to give user option to place aces high or low
  end
end




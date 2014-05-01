#Interactive commandline blackjack game
def say(msg)
  puts "#{msg}"
end

def calculate_total(cards) 
  arr = cards.map{|e| e[1] }

  total = 0
  
  arr.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select{|e| e == 'A'}.count.times do
    total -= 10 if total > 21
  end

  total
end

def play_again(my_cards, dealer_cards)
  playing = true
  my_cards.delete_if{ |e| e == true }
  dealer_cards.delete_if{ |e| e == true }

end

#Start Game
say "-----------------------------------------"
say "-----------------------------------------"
say "Welcome to Blackjack"
say "-----------------------------------------"
say "-----------------------------------------"
say "What should I call you?"
player_name = gets.chomp
say "Hi #{player_name.capitalize}, lets play"

# while true
#   if bet > 0 
#     say "You've bet $#{bet}, lets play!"
#   break
#   else 
#     puts "Don't be stingy, the minimum bet is $1"
#     say "You have $200, how much would you like to bet?"
#     bet = gets.chomp.to_i
#   end
# end

suits = ['H', 'D', 'S', 'C', 'H', 'D', 'S', 'C', 'H', 'D', 'S', 'C', 
         'H', 'D', 'S', 'C', 'H', 'D', 'S', 'C', 'H', 'D', 'S', 'C',]
cards = ['2', '3', '4', '5', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!
my_cards = []
dealer_cards = []

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

dealer_total = calculate_total(dealer_cards)
my_total = calculate_total(my_cards)

playing = true
while playing
  say "-----------------------------------------"
  say "-----------------------------------------"
  say "Dealer has: #{dealer_cards[0]}, #{dealer_cards[1]} , #{dealer_cards[2]}, #{dealer_cards[3]}, #{dealer_cards[4]}"
  say "You have: #{my_cards[0]}, #{my_cards[1]}, #{my_cards[2]}, #{my_cards[3]}, #{my_cards[4]}"
  my_total = calculate_total(my_cards)
  say "Your total is #{my_total}, the dealer has #{dealer_total}"
  say "-----------------------------------------"
  say "-----------------------------------------"
  say "What would you like to do #{player_name.capitalize}? 1) HIT or 2) STAY"
  hit_or_stay = gets.chomp
  
  if my_total == 21
  say "You got Blackjack!"
  say "Play again? 1) YES 2) NO"
  play = gets.chomp
    if play == '1'
      my_cards.delete('H', 'S', 'D', 'C')
      play_again
    else 
      puts "#{player_name.capitalize} leaves the table with. See you next time"
      playing = false
    end
  end

  if hit_or_stay == '1'
    my_cards << deck.pop
    my_total = calculate_total(my_cards)
    
    if my_total > 21
      say "You're bust"
      say "Play again? 1) YES 2) NO"
      play = gets.chomp
      
      if play == '1'
        play_again(my_cards, dealer_cards)
      else 
        puts "#{player_name.capitalize} leaves the table. See you next time"
        playing = false
      end
    
    end
  
  elsif hit_or_stay == '2'
    
    while dealer_total < 17
      say "Dealer hits"
      dealer_cards << deck.pop
      dealer_total = calculate_total(dealer_cards)
      say "Dealer total is #{dealer_total}"   
    end           
    
    if dealer_total > my_total
    say "Sorry #{player_name.capitalize}, the dealer wins :-("
    say "Play again? 1) YES 2) NO"
    play = gets.chomp
      
      if play == '1'
        my_cards.delete('H', 'S', 'D', 'C')
        play_again(my_cards, dealer_cards)
      else 
        puts "#{player_name.capitalize} leaves the table. See you next time"
        playing = false
      end  

    elsif my_total > 21 
    say "You're bust"
    say "Play again? 1) YES 2) NO"
    play = gets.chomp
      if play == '1'
        play_again(my_cards, dealer_cards)
      else 
        puts "#{player_name.capitalize} leaves the table with. See you next time"
        playing = false
      end
    else
    say "You win!"
    say "Play again? 1) YES 2) NO"
    play = gets.chomp
    
      if play == '1'
        play_again(my_cards, dealer_cards)
      else 
        puts "#{player_name.capitalize} leaves the table. See you next time"
        playing = false
      end
  
    end
  end
end

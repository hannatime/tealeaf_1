#Interactive commandline blackjack game

#Say message method
def say(msg)
  puts "#{msg}"
end

#Calculate cards method
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

#Game Start
say "-----------------------------------------"
say "-----------------------------------------"
say "Welcome to Blackjack"
say "-----------------------------------------"
say "-----------------------------------------"
say "What should I call you?"
player_name = gets.chomp
say "-----------------------------------------"
say "-----------------------------------------"
say ""
say "Hi #{player_name.capitalize}, lets play"
say ""

suits = ['H', 'D', 'S', 'C']
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

#Show First Cards
say "-----------------------------------------"
say "-----------------------------------------"
say "Dealer has: #{dealer_cards[0]} and *card hidden*"
say "#{player_name.capitalize} has: #{my_cards[0]} and #{my_cards[1]}"
say "#{player_name.capitalize}s total is #{my_total}."
say "-----------------------------------------"
say "-----------------------------------------"
say ""


#Player Turn Iterator
while my_total < 21

  say "What would you like to do #{player_name.capitalize}? enter 1) for HIT or 2) for STAY"
  hit_or_stay = gets.chomp
  
#Hit or stay conditional
  if hit_or_stay == '1'
    my_cards << deck.pop
    my_total = calculate_total(my_cards)
    say "Dealer has: #{dealer_cards[0]} and *card hidden*"
    say "#{player_name.capitalize} has: #{my_cards[0]} #{my_cards[1]} #{my_cards[2]} #{my_cards[3]} #{my_cards[4]}"
    say "#{player_name.capitalize}s total is #{my_total}."
  
  elsif hit_or_stay == '2'
    break
  end
end

    #Blackjack edgecase conditional 
  
  if my_total == 21
    say "Congratulations #{player_name.capitalize}, you got blackjack you win" 
    exit
  end

  if my_total > 21
    say "Sorry #{player_name.capitalize}, you're Bust"
    exit
  end

say "*the dealer turns over their card*"
say "Dealer has: #{dealer_cards[0]} #{dealer_cards[1]}"
say "#{player_name.capitalize}s total is #{my_total}, the dealer has #{dealer_total}" 

#Dealer Turn Iterator
while dealer_total < 17
    say "The dealer hits"
    dealer_cards << deck.pop
    dealer_total = calculate_total(dealer_cards)
    say "Dealer has: #{dealer_cards[0]} #{dealer_cards[1]} #{dealer_cards[2]} #{dealer_cards[3]} #{dealer_cards[4]}"
    say "#{player_name.capitalize} has: #{my_cards[0]} #{my_cards[1]} #{my_cards[2]} #{my_cards[3]} #{my_cards[4]}"
    say "#{player_name.capitalize}s total is #{my_total}, the dealer has #{dealer_total}"
end
    
if dealer_total == 21
  say "Sorry #{player_name.capitalize}, the dealer got blackjack you lose"
  exit
end

if dealer_total > 21
  say "The dealer is bust, you win!"
  exit

elsif dealer_total > my_total
  puts "The dealer has #{dealer_total}, you have #{my_total}"
  puts "Sorry #{player_name.capitalize}, the dealer wins"

elsif dealer_total == my_total
  puts "The dealer has #{dealer_total}, you have #{my_total}"
  puts "It's a draw, no one wins"
  exit

elsif my_total > dealer_total
  puts "Sweet, you have #{my_total}, the dealer has #{dealer_total}"
  puts "#{player_name.capitalize} wins"
  exit
end
  

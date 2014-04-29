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



say "welcome to blackjack"
say "What should I call you?"
player_name = gets.chomp
say "#{player_name.capitalize}, you have $200. How much would you like to bet?"
bet = gets.chomp.to_i 
while true
  if bet > 0 
    say "You've bet $#{bet}, lets play!"
  break
  else 
    puts "Don't be stingy"
    say "You have $200, how much would you like to bet?"
    bet = gets.chomp.to_i
  end
end

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

#Show Cards
#say "You're cards are" + my_cards.to_s
#say "The dealers has" + dealer_cards.to_s

while my_total <= 21 || dealer_total <= 21
say "-----------------------------------------"
say "-----------------------------------------"
say "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}"
say "You have: #{my_cards[0]}, #{my_cards[1]}, #{my_cards[2]}"
say "Your total is #{my_total}, the dealer has #{dealer_total}"
say "-----------------------------------------"
say "-----------------------------------------"
say ""
say "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp
say ""
end


# if hit_or_stay = '1'
#   say "You chose hit, good luck"
#   my_cards << deck.pop
#   say "-----------------------------------------"
#   say "-----------------------------------------"
#   say "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]}"
#   say "You have: #{my_cards[0]},#{my_cards[1]} and #{my_cards[2]}"
#   my_total = calculate_total(my_cards)
#   say "Your total is #{my_total}, the dealer has #{dealer_total}"
#   say "-----------------------------------------"
#   say "-----------------------------------------"
#   say ""
#   say "What would you like to do? 1) hit 2) stay"
#   hit_or_stay = gets.chomp
#   say ""
# else 
# end
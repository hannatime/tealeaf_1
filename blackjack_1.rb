
def say(msg)
  puts "-----#{msg}-----"
end

#deck creator, creates and shuffles new decks
cards = ['S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8', 'S9', 'S10', 'SJ', 'SQ', 'SK', 'SA', 'H2', 'H3', 'H4', 'H5', 'H6', 'H7', 'H8', 'H9', 'H10', 'HJ', 'HQ', 'HK', 'HA', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'D10', 'DJ', 'DQ', 'DK', 'DA', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10', 'CJ', 'CQ', 'CK', 'CA']

#decks
deck_1 = []
deck_2 = []
deck_3 = []
deck_4 = []
deck_5 = []
deck_6 = []
deck_7 = []
deck_8 = []
deck_9 = []
deck_10 = []
deck_1 = cards.shuffle
deck_2 = cards.shuffle
deck_3 = cards.shuffle
deck_4 = cards.shuffle
deck_5 = cards.shuffle
deck_6 = cards.shuffle
deck_7 = cards.shuffle
deck_8 = cards.shuffle
deck_9 = cards.shuffle
deck_10 = cards.shuffle

# card shoe
# loads decks of cards and shuffles them

shoe = []

shoe.push deck_1
shoe.push deck_2
shoe.push deck_3
shoe.push deck_4
shoe.push deck_5
shoe.push deck_6
shoe.push deck_7
shoe.push deck_8
shoe.push deck_9
shoe.push deck_10

#player introduction
say "Hi there, let's play some Blackjack, what's your name?"
player_one = gets.chomp
say "Hi #{player_one}, you have $200 to play with, place your first bet?"
bet_one = gets.chomp

#(Add in some code to check whether the bet is a string, integer or float)

#card game







say  'Unshuffled Cards'
puts cards
say  'Deck 1'
puts deck_1
say 'Shoe'

shoe.each{|a| puts a}
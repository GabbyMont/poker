faces = "AKQJT98765432"
suits = "cdhs"

# Create an array to push the selected cards into
deck = []
# .each_byte seperates characters in a string // ["A", "K", "Q", "J", "T","9","8"...]
faces.each_byte do |f|
# ["c", "d", "h", "s"]
 suits.each_byte do |s|
# Adds a character from the faces string to a character from the suits string and pushes them into an array // ["4s", "6d", "Jd", "As", "5c"]
   deck.push(f.chr + s.chr)
 end
end

p deck.length

################################

def hand_builder()
faces = "AJKQ98765432"
suits = "cdhs"
deck = []
hands = {}
	faces.each_byte do |f|
		suits.each_byte do |s|
		   deck.push(f.chr + s.chr)
		   # Shuffles the deck array after the faces and suits characters have been added together into one array
		   deck = deck.shuffle!
		end
	end
	hand1 = deck.pop(5)
	hand2 = deck.pop(5)
	# Takes the hands hash and sets key of hand1 equal to value of hand1 // If hand one does not exist as a key then it will be created // If hand1 does exist it will just update the value that is there
	hands["hand1"] = hand1
	hands["hand2"] = hand2
	hands
end

##################################

faces = [14,13,12,11,10,9,8,7,6,5,4,3,2]
suits = ["c","d","h","s"]
deck = {}
hands = {}
	faces.each do |f|
		suits.each do |s|
		   deck["s"] = f.to_s
		   deck = deck.shuffle!
		end
	end
	hand1 = deck.pop(5)
	hand2 = deck.pop(5)
	# Takes hands hash and sets key of hand one equal to value of hand one // If hand one does not exist as a key then it will be created // If hand1 does exist it will just update the value that is there
	hands["hand1"] = hand1
	hands["hand2"] = hand2
	hands
end

def card_game(hand1,hand2)
	hand1
	hand2
end

p hand_builder()

################################################

def hand_builder()
faces = [14,13,12,11,10,9,8,7,6,5,4,3,2]
suits = ["c","d","h","s"]
deck = {}
hands = {}
	faces.each do |f|
		suits.each do |s|
		   deck["s"] = f.to_s
		   deck = deck.shuffle!
		end
	end
	hand1 = deck.pop(5)
	hand2 = deck.pop(5)
	# Takes hands hash and sets key of hand one equal to value of hand one // If hand one does not exist as a key then it will be created // If hand1 does exist it will just update the value that is there
	hands["hand1"] = hand1
	hands["hand2"] = hand2
	hands
end

def card_game(hand1,hand2)
	hand1
	hand2
end

p hand_builder()

#######################################

deck = {
    "hearts" => [2,3,4,5,6,7,8,9,10,"J","Q","K","A"],
    "diamonds" => [2,3,4,5,6,7,8,9,10,"J","Q","K","A"],
    "spades" => [2,3,4,5,6,7,8,9,10,"J","Q","K","A"],
    "clubs" => [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
}

def create_deck(deck)
  hand = deck[deck.keys.sample]
  puts hand
  hand
end

#########################
#########################
#########################

def deal_with_tie(hand)
	counter = 1
	match_card = 0
	hand.each do |num|
		hand_mock = hand.delete_at(counter)
		if hand_mock.include?(num)
			match_card = num
		end
		counter += 1
	end
	match_card
end

def removed_duplicates(hand,matched)
	hand = 
	new_hand = hand.delete(matched)
	new_hand = 
	last_hand = hand.last
end

def eavaluate_tie(hand1,hand2)
	hand1_match = deal_with_tie(hand1)
	hand2_match = deal_with_tie(hand2)
	if hand1 == hand2
		high1 = highcard(hand2)
		high2 = highcard(hand2)
	end
	if hand1_match > hand2_match
		"Hand One is winner"
	end
end
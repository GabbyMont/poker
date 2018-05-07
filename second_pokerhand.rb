def hand_builder()
faces = "AJKQT98765432"
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

def compare_straights(hand1,hand2)
	if hand1 > hand2
		true
	else 
		false
	end
end

############################################

# look_at_tie function looks at each position(then deletes it from hand being evaluated) in hand and counts each dulpicated card
def look_at_tie(hand1,hand2)
	# Sets counter equal to one
	counter = 1
	# Sets match_card equal to 0
	match_card1 = 0
	# Hand loop to evaluate each postion in array
	hand1.each do |num|
		# Deletes counter position(position in hand after evaluated)
		hand_mock = hand1.delete_at(counter)
		# If matched_card is the included number...
		if hand_mock.include?(num)
			# ...then the two numbers equal
			match_card1 = num
		end
		counter += 1
	end
	match_card1

	# Sets counter equal to one
	counter = 1
	# Sets match_card equal to 0
	match_card2 = 0
	# Hand loop to evaluate each postion in array
	hand2.each do |num|
		# Deletes counter position(position in hand after evaluated)
		hand_mock = hand2.delete_at(counter)
		# If matched_card is the included number...
		if hand_mock.include?(num)
			# ...then the two numbers equal
			match_card2 = num
		end
		# Adds counter(to move through each position)
		counter += 1
	end
	match_card2
end

def kicker_card(hand,matched)
	new_hand = hand.delete(matched)
	last_hand = hand.last
end

def evaluate_tie(hand1,hand2)
	hand1_match = look_at_tie(hand1)
	hand2_match = look_at_tie(hand2)
	if hand1 == hand2
		high1 = kicker_card(hand1)
		high2 = kicker_card(hand2)
		if high1 > high2
			"Hand One wins"
		else high2 > high1
			"Hand Two wins"
		end
	elsif hand1_match > hand2_match
		"Hand One is the winner"
	else
		"Hand Two is the winner"
	end
end
#################################

def face_changer(face_value)
	# Loops face_value and updates the new array with the given number
	face_value = face_value.map do |face|
		if	face == "A"
			14
		elsif face == "K"
			13
		elsif face == "Q"
			12
		elsif face == "J"
			11
		elsif face == "T"
			10
		else
			face.to_i
		end
	end
	face_value
end

def hand_comparison(hands)
	starter_hands = hands.clone
	starter_hands
	starter_hands.each do |key,value|
		if royal_flush(value) == true
			starter_hands[key] = 10
		elsif straight_flush(value) == true
			starter_hands[key] = 9
		elsif four_of_a_kind(value) == true
			starter_hands[key] = 8
		elsif full_house(value) == true
			starter_hands[key] = 7
		elsif flush(value) == true
			starter_hands[key] = 6
		elsif straight(value) == true
			starter_hands[key] = 5
		elsif three_of_a_kind(value) == true
			starter_hands[key] = 4
		elsif two_pair(value) == true
			starter_hands[key] = 3
		elsif pair(value) == true
			starter_hands[key] = 2
		else high_card(value) == true
			starter_hands[key] = 1
		end
	end
	
	# If cloned hand1 is greater than cloned hand2 then print the string below
	if starter_hands["hand1"] > starter_hands["hand2"]
		"Player One is the winner"
	# If cloned hand1 is less than cloned hand2 then print the string below
	elsif starter_hands["hand1"] < starter_hands["hand2"]
		"Player Two is the winner"
	# Else if cloned hand1 is equal to cloned hand2 then look at straight_tiebreaker
	else starter_hands["hand1"] == starter_hands["hand2"]
		straight_tiebreaker(hands['hand1'],hands['hand2'])
	end
end


# tie breaker is splitting the hands and gathering sum then returning winning score(highest sum)
def straight_tiebreaker(hand1,hand2)
  suit_value = []
  face_value = []
  hand1.each do |card|
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray = [*face_value[0]..face_value[0]+4]
    array_sum = newarray.sum

  hand2.each do |card|
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray = [*face_value[0]..face_value[0]+4]
    array_sum = newarray.sum
end


def royal_flush(hand)
# Creates array for specific suit // Ex.) h(hearts)
suit_value = []
# Creates array for all faces required to win // Ex.) In order => ["A","K","Q","J","T"]
face_value = []
	# Loop to iterate over each individual card in the hands hash
	hand.each do |card|
		# Pushes index[0] of card into face_value array(The first index of each string => face: A..T)
		face_value << card[0]
		# Pushes index[0] of card into face_value array(The second index of each string => suit: clubs..spades )
		suit_value << card[1]
	end
	# If statement checking length of the suit value after suits are seperated from royal flush => should all be "d" for diamonds(uniq removes all duplicates making the length 1)
	if suit_value.uniq.length == 1
		# Then if face_value inlcudes the ["A", "K", "Q", "J", "T"] faces...
		if face_value.include?("A") && face_value.include?("K") && face_value.include?("Q") && face_value.include?("J") && face_value.include?("T")
			# ...The hand1 value will return true
			true
		end
	end
end

def straight_flush(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	face_value = face_changer(face_value)
	face_value.sort!
	# Makes array for consecutive numbers in a hand
	newarray = [*face_value[0]..face_value[0]+4]
	thearray = newarray.sum
	# p "this is the new array of values #{thearray}"
	# Removes duplicates and gives length of remaining card type
	if suit_value.uniq.length == 1
		# Evaluating hand and testing if true
		if face_value == newarray
			true
		end
	end
end

def four_of_a_kind(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	# Evaluating hand for duplicates and testing if true
	if face_value.uniq.length == 2
		true
	end
end

def three_of_a_kind(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	if face_value.uniq.length == 3
		true
	end
end

def pair(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	if face_value.uniq.length == 4
		true 
	end
end

def full_house(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	if face_value.uniq.length == 2
		true
	end
end

def flush(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	if suit_value.uniq.length == 1
		true
	end
end

def straight(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	face_value = face_changer(face_value)
	face_value.sort!
	newarray = [*face_value[0]..face_value[0]+4]
	if face_value == newarray
		true
	end
end

def two_pair(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	if face_value.uniq.length == 3
		true 
	end
end

def high_card(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	face_value = face_changer(face_value)
	face_value.sort!
	true
end
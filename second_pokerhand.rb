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
	face_value1 = []
	face_value2 = []
	result = ""

	hand1.each do |card|
		face_value1 << card[0]
	end
	royal_hand1 = face_changer(face_value1)
  	matches1 = royal_hand1.sort
 	hand1_dupes = matches1.select{|item| matches1.count(item) > 1}.uniq
 	matched_number1 = hand1_dupes[0]

	hand2.each do |card|
		face_value2 << card[0]
	end
	hand2_faces = face_changer(face_value2)
  	matches2 = royal_hand1.sort
  	hand2_dupes = matches2.select{|item| matches2.count(item) > 1}.uniq
  	matched_number2 = hand2_dupes[0]
	
	# If hand1_single_digit > hand2_single_digit then result = "hand1 wins" else result = "hand2 wins"
	matched_number1 > matched_number2 ? result = "hand1 wins" : result = "hand2 wins"
end

# def kicker_card(hand,matched)
# 	new_hand = hand.delete(matched)
# 	last_hand = hand.last
# end

# def evaluate_tie(hands)
# 	hands["hand1"] = hand1
# 	hands["hand2"] = hand2
# 	hand1_match = look_at_tie(hands["hand1"])
# 	hand2_match = look_at_tie(hands["hand2"])
# 	if hands["hand1"] == hands["hand2"]
# 		high1 = kicker_card(hands["hand1"])
# 		high2 = kicker_card(hands["hand2"])
# 	end
# 	if high1['hand1'] > high2['hand2']
# 		"Hand One wins"
# 	else high2['hand2'] > high1['hand1']
# 		"Hand Two wins"
# 	end
# end
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
	# else starter_hands["hand1"] == starter_hands["hand2"]
	# 	straight_tiebreaker(hands['hand1'],hands['hand2'])
	# end
	else starter_hands["hand1"] == starter_hands["hand2"]
		look_at_tie(hands['hand1'],hands['hand2'])
	end
end


# tie breaker is splitting the hands and gathering sum then returning winning score(highest sum)
# def straight_tiebreaker(hand1,hand2)
#   	suit_value = []
#   	face_value = []
#   	array_sum1 = []
#   	array_sum2 = []
#   	result = ""
#   hand1.each do |card|
#     face_value << card[0]
#     suit_value << card[1]
#   end
#     face_value = face_changer(face_value)
#     face_value.sort!
#     newarray1 = [*face_value[0]..face_value[0]+4]
#     array_sum1 = newarray1.sum

#   hand2.each do |card|
#     face_value << card[0]
#     suit_value << card[1]
#   end
#     face_value = face_changer(face_value)
#     face_value.sort!
#     newarray2 = [*face_value[0]..face_value[0]+4]
#     array_sum2 = newarray2.sum
#     if array_sum1 > array_sum2
#     	result = "hand1 wins"
#     else 
#     	result = "hand2 wins"
#     end
#    	result
# end

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
	# If statement checking length of the suit value after suits are separated from royal flush => should all be "d" for diamonds(uniq removes all duplicates making the length 1)
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
	if suit_value.uniq.length == 4
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
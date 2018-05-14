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

def card_separator(hand)
# Creates array for specific suit
suit_value = []
# Creates array for all faces required to win
face_value = []
	# Loop to iterate over each individual card in the hands hash
	hand.each do |card|
		# Pushes index[0] of card into face_value array
		face_value << card[0]
		# Pushes index[0] of card into face_value array
		suit_value << card[1]
	end
end

# look_at_tie function looks at each position(then deletes it from hand being evaluated) in hand and counts each dulpicated card
def look_at_tie(hand1,hand2)
	face_value1 = []
	face_value2 = []
	kicker_card_message = ""
	result = ""
	high_number_string = ""

	hand1.each do |card|
		face_value1 << card[0]
	end
	hand1_faces = face_changer(face_value1)
  	matches1 = hand1_faces.sort
  	new_hand1 = matches1.group_by { |card| card }.select { |k, v| v.size.eql? 1 }.keys
 	hand1_dupes = matches1.select{|item| matches1.count(item) > 1}.uniq
 	hand1_dupes_sum = hand1_dupes.sum
 	high_num1 = new_hand1.last
 	next_kicker1 = new_hand1.pop
  	last_card1 = new_hand1.last

	hand2.each do |card|
		face_value2 << card[0]
	end
	hand2_faces = face_changer(face_value2)
  	matches2 = hand2_faces.sort
  	new_hand2 = matches2.group_by { |card| card }.select { |k, v| v.size.eql? 1 }.keys
  	hand2_dupes = matches2.select{|item| matches2.count(item) > 1}.uniq
 	hand2_dupes_sum = hand2_dupes.sum
 	high_num2 = new_hand2.last
 	next_kicker2 = new_hand2.pop
  	last_card2 = new_hand2.last

	if hand1_dupes_sum > hand2_dupes_sum 
		result = "hand1 wins" 
	elsif hand1_dupes_sum < hand2_dupes_sum
	 	 result = "hand2 wins"
	else hand1_dupes_sum == hand2_dupes_sum
		if high_num1 > high_num2
      		high_number_string = "hand1 is the winner"
    	elsif high_num1 < high_num2
      		high_number_string = "hand2 is the winner"
      	elsif last_card1 >  last_card2
      		kicker_card_message = "Hand1 is the winner"
      	else last_card2 > last_card1
      		kicker_card_message = "Hand2 is the winner"
      	end
    end
end

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
	# elsif starter_hands["hand1"] == starter_hands["hand2"]
	# 	straight_tiebreaker(hands['hand1'],hands['hand2'])
	# end
	else starter_hands["hand1"] == starter_hands["hand2"]
		look_at_tie(hands['hand1'],hands['hand2'])
	end
end

# tie breaker is splitting the hands and gathering sum then returning winning score(highest sum)
def straight_tiebreaker(hand1,hand2)
  	suit_value = []
  	face_value = []
  	array_sum1 = []
  	array_sum2 = []
  	result = ""
  hand1.each do |card|
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray1 = [*face_value[0]..face_value[0]+4]
    array_sum1 = newarray1.sum

  hand2.each do |card|
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray2 = [*face_value[0]..face_value[0]+4]
    array_sum2 = newarray2.sum
    if array_sum1 > array_sum2
    	result = "hand1 wins"
    else 
    	result = "hand2 wins"
    end
   	result
end

def royal_flush(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	# suit_value = card_separator(hand)
	# If statement checking length of the suit value after suits are separated from royal flush => should all be "d" for diamonds(uniq removes all duplicates making the length 1)
	if suit_value.uniq.length == 1
		# Then if face_value inlcudes the ["A", "K", "Q", "J", "T"] faces, the hand1 value will return true
		true if face_value.include?("A") && face_value.include?("K") && face_value.include?("Q") && face_value.include?("J") && face_value.include?("T")
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
	# Removes duplicates and gives length of remaining card type
	if suit_value.uniq.length == 1
		# Evaluating hand and testing if true
		true if face_value == newarray
	end
end

def four_of_a_kind(hand)
	face_value = card_separator(hand)
	# face_value = face_changer(face_value)
	# face_value.sort!
	# Evaluating hand for duplicates and testing if true
	true if face_value.uniq.length == 2
end

def three_of_a_kind(hand)
	face_value = card_separator(hand)
	# face_value = face_changer(face_value)
	# face_value.sort!
	true if face_value.uniq.length == 3
end

def pair(hand)
	suit_value = card_separator(hand)
	# face_value = face_changer(face_value)
	# face_value.sort!
	true if suit_value.uniq.length == 4
end

def full_house(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	# face_value = card_separator(hand)
	true if face_value.uniq.length == 2
end

def flush(hand)
	suit_value = card_separator(hand)
	# face_value = face_changer(face_value)
	# face_value.sort!
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
	true if face_value == newarray
end

def two_pair(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	# face_value = face_changer(face_value)
	# face_value.sort!
	# face_value = card_separator(hand)
	if face_value.uniq.length == 3
		true
	end
end

def high_card(hand)
	face_value = card_separator(hand)
	# face_value = face_changer(face_value)
	# face_value.sort!
	true
end

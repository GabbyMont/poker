def hand_builder()
# Setting faces equal to string to later be split with each_byte
faces = "AJKQT98765432"
suits = "cdhs"
# Empty array to later hold mixed deck. Ex: ["Kh", "Kd", "7d", etc.]
deck = []
# Empty hands hash to hold both split hands with 5 cards each. Ex: {"hand1" => ["4h", "Js", "Jc", "7h", "6d"], "hand2" => ["9h", "3h", "6h", "5h", "8h"]}
hands = {}
	# each_byte separates by position in string. Ex: "AJKQT98765432" => [A, J, K, Q, T, 9, 8, 7, 6, 5, 4, 3, 2, 1] 
	faces.each_byte do |f|
		# Same for the suits... Ex: "cdhs" => [c,d,h,s]
		suits.each_byte do |s|
			# Pushes faces and suits into the deck array.\\ The .chr method converts the letters and numbers back into strings: c => "c"
		   deck.push(f.chr + s.chr)
		   # Shuffles the deck array after the faces and suits characters have been added together into one array
		   deck = deck.shuffle!
		end
	end
# Pops 5 mixed cards off and sets it equal to hand1
hand1 = deck.pop(5)
# Pops 5 mixed cards off and sets it equal to hand2
hand2 = deck.pop(5)
# Takes the hands hash and sets key of hand1 equal to value of hand1 // If hand one does not exist as a key then it will be created but if hand1 does exist it will just update the value that is there
hands["hand1"] = hand1
# Takes the hands hash and sets key of hand2 equal to value of hand2 // If hand two does not exist as a key then it will be created but if hand2 does exist it will just update the value that is there
hands["hand2"] = hand2
# Returning hands hash
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
	# Empty face_value1 array created for hand1 faces
	face_value1 = []
	# Empty face_value2 array created for hand2 faces
	face_value2 = []
	# Empty string for winning message in conditional 
	result = ""

	hand1.each do |card|
		# Pushing the face of each card into the empty array and grabbing it by the first index. Ex: "Kd" => "K" ("[0][1]")
		face_value1 << card[0]
	end 
	# Setting the face_changer function equal to the hand1_faces variable
	hand1_faces = face_changer(face_value1)
	# Sorting the array of faces(after they go through facechanger they turn into integers)
 	sorted_faces1 = hand1_faces.sort
 	sorted_faces_sum1 = sorted_faces1.sum
 	# new_hand1 puts non-duplicated elements into an array
  	new_hand1 =	sorted_faces1.group_by { |card| card }.select { |k, v| v.size.eql? 1 }.keys
  	# Finds the duplicates and returns one
 	hand1_dupes = sorted_faces1.select{|item| sorted_faces1.count(item) > 1}.uniq
 	# Adds duplicates together
 	hand1_dupes_sum = hand1_dupes.sum
 	next_kicker1 = new_hand1.pop

	hand2.each do |card|
		face_value2 << card[0]
	end
	hand2_faces = face_changer(face_value2)
  	sorted_faces2 = hand2_faces.sort
  	sorted_faces_sum2 = sorted_faces2.sum
  	new_hand2 = sorted_faces2.group_by { |card| card }.select { |k, v| v.size.eql? 1 }.keys
  	hand2_dupes = sorted_faces2.select{|item| sorted_faces2.count(item) > 1}.uniq
 	hand2_dupes_sum = hand2_dupes.sum
 	next_kicker2 = new_hand2.pop

  	# If hand1's duplicate sum is greater than hand2's duplicate sum then return the "hand1 wins string"
	if hand1_dupes_sum > hand2_dupes_sum 
		result = "hand1 wins" 
  	# If hand1's duplicate sum is less than hand2's duplicate sum then return the "hand2 wins string"
	elsif hand1_dupes_sum < hand2_dupes_sum
	 	 result = "hand2 wins"
  	# If hand1's duplicate sum is equal to hand2's duplicate sum then go to next conditional
	else 
    	result = split_the_pot(hand1,hand2)
    end
end

def split_the_pot(hand1,hand2)
	face_value1 = []
	face_value2 = []

	hand1.each do |card|
		face_value1 << card[0]
	end
	hand1_faces = face_changer(face_value1)
	sorted_faces1 = hand1_faces.sort

	hand2.each do |card|
		face_value2 << card[0]
	end
	hand2_faces = face_changer(face_value2)
	sorted_faces2 = hand2_faces.sort



	if sorted_faces1[4] > sorted_faces2[4]
    	result = "hand1 card 5 is the winner"
      	# If the remaining card in hand1 is less than the remaining card in hand2 then return "Hand2 is the winner"
    elsif sorted_faces1[4] < sorted_faces2[4]
    	result = "hand2 card 5 is the winner"
    else sorted_faces1[4] == sorted_faces2[4]
    	if sorted_faces1[3] > sorted_faces2[3]
    		result = "hand1 card 4 wins"
    	elsif sorted_faces1[3] < sorted_faces2[3]
    		result = "hand2 card 4 wins"
    	else sorted_faces1[3] == sorted_faces2[3]
    		if sorted_faces1[2] > sorted_faces2[2]
    			result = "hand1 card 3 wins"
    		elsif sorted_faces1[2] < sorted_faces2[2]
    			result = "hand2 card 3 wins"
    		else sorted_faces1[2] == sorted_faces2[2]
          		if sorted_faces1[1] > sorted_faces2[1]
    				result = "hand1 card 4 wins"
    			elsif sorted_faces1[1] < sorted_faces2[1]
    				result = "hand2 card 4 wins"
    			else sorted_faces1[1] == sorted_faces2[1]
    				if sorted_faces1[0] > sorted_faces2[0]
    					result = "hand1 card 4 wins"
    				elsif sorted_faces1[0] < sorted_faces2[0]
    					result = "hand2 card 4 wins"
    				else sorted_faces1[0] == sorted_faces2[0]
    					result = "Split the pot"
    				end
    			end
    		end
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
			# Converts string of given number into integer
			face.to_i
		end
	end
end

def hand_comparison(hands)
	# Clones the hands hash and runs the copy through the values
	starter_hands = hands.clone
	starter_hands.each do |key,value|
		if royal_flush(value) == true
			starter_hands[key] = 100
		elsif straight_flush(value) == true
			starter_hands[key] = 90
		elsif four_of_a_kind(value) == true
			starter_hands[key] = 80
		elsif full_house(value) == true
			starter_hands[key] = 70
		elsif flush(value) == true
			starter_hands[key] = 60
		elsif straight(value) == true
			starter_hands[key] = 50
		elsif three_of_a_kind(value) == true #
			starter_hands[key] = 40
		elsif two_pair(value) == true #
			starter_hands[key] = 30
		elsif pair(value) == true #
			starter_hands[key] = 20
		else high_card(value) == true #
			starter_hands[key] = 10
		end
	end

	# If cloned hand1 is greater than cloned hand2 then print the string below
	if starter_hands["hand1"] > starter_hands["hand2"]
		"Player One is the winner"
	# If cloned hand1 is less than cloned hand2 then print the string below
	elsif starter_hands["hand1"] < starter_hands["hand2"]
		"Player Two is the winner"
	# Else if cloned hand1 is equal to cloned hand2 then look at straight_tiebreaker
	elsif starter_hands["hand1"] == starter_hands["hand2"]
		look_at_tie(hands['hand1'],hands['hand2'])
	end
end

def royal_flush(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
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
	# Creates array for consecutive numbers in a hand
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
	true if face_value.uniq.length == 2
end

def full_house(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	true if face_value.uniq.length == 2
end

def flush(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	true if suit_value.uniq.length == 1
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

def three_of_a_kind(hand)
	face_value = card_separator(hand)
	true if face_value.uniq.length == 3

end

def two_pair(hand)
suit_value = []
face_value = []
	hand.each do |card|
		face_value << card[0]
		suit_value << card[1]
	end
	true if face_value.uniq.length == 3
end

def pair(hand)
	suit_value = card_separator(hand)
	true if suit_value.uniq.length == 4
end

def high_card(hand)
	face_value = card_separator(hand)
	true
end

hands = hand_builder
p hands
p hand_comparison(hands)

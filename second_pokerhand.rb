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
	# hand2 = deck.pop(5)
	# Takes the hands hash and sets key of hand1 equal to value of hand1 // If hand one does not exist as a key then it will be created // If hand1 does exist it will just update the value that is there
	hands["hand1"] = hand1
	# hands["hand2"] = hand2
	royal_flush(hands)
	hands
end

def royal_flush(hands)
	# Creates array for specific suit // Ex.) h(hearts)
	suit_value = []
	# Creates array for all faces required to win // Ex.) In order => ["A","K","Q","J","T"]
	face_value = []
	hand = hands['hand1']
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
				# ...The hand1 value will come back as the string below
				hands["hand1"] = "Winner Winner Chicken Dinner"
			end
		end
	# Returns hands hash
	hands
end

def straight_flush(hands)
	suit_value = []
	face_value = []
	hand  = hands['hand1']
		hand.each do |card|
			face_value << card[0]
			suit_value << card[1]
		end
		# if suit_value.uniq.length == 1
		# 	if face_value.sort.include?
				
		# 	end
		# end
	hands
end

def face_changer(face_value)
	face_value
end

# Returns hand builder function
hand_builder()
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

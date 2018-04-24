hand1 = []
hand2 = []

def hand_builder()
faces = "AKQJT98765432"
suits = "cdhs"
deck = []
	faces.each_byte do |f|
		suits.each_byte do |s|
		   deck.push(f.chr + s.chr)
		   deck = deck.shuffle!
		end
	end
	hand1 = deck.pop(5)
	hand1
	hand2 = deck.pop(5)
	hand2
	card_game(hand1,hand2)
end

def card_game(hand1,hand2)
	hand1
	hand2
end

p hand_builder()

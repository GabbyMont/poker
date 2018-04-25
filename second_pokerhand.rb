def hand_builder()
faces = "AJKQ98765432"
suits = "cdhs"
deck = []
hands = {}
	faces.each_byte do |f|
		suits.each_byte do |s|
		   deck.push(f.chr + s.chr)
		   deck = deck.shuffle!
		end
	end
	hand1 = deck.pop(5)
	hand2 = deck.pop(5)
	hands["hand1"] = hand1
	hands["hand2"] = hand2
	hands
end

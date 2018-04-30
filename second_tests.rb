require 'minitest/autorun'
require_relative 'second_pokerhand.rb'

class Poker_Hand_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_hash_class
		assert_equal(Hash,hand_builder().class)
	end

	def test_for_one_hands # Adjust later on to take two hands
		assert_equal(1, hand_builder.length)
	end

	def test_hand1_length
		hand_length1 = hand_builder()["hand1"]
		# hand_length2 = hand_builder()["hand2"]
		assert_equal(5,hand_length1.length)
		# assert_equal(5,hand_length2.length)
	end

	def test_no_duplicates
		hand1 = hand_builder()["hand1"]
		# hand2 = hand_builder()["hand2"]
		assert_equal(hand1,hand1.uniq)
		# assert_equal(hand2,hand2.uniq)
	end

	def test_royal_flush_hash
		hand = {"hand1" => ["Ad", "Kd", "Qd", "Jd","Td"]}
		assert_equal(Hash,royal_flush(hand).class)
	end

	def test_winner_royal
		winner = {"hand1" => "Winner Winner Chicken Dinner"}
		hand = {"hand1" => ["Ad", "Kd", "Qd", "Jd","Td"]}
		assert_equal(winner,royal_flush(hand))
	end

	def test_straight_flush_hash
		hand = {"hand1" => ["Ts", "9s", "6s", "8s","7s"]}
		assert_equal(Hash,straight_flush(hand).class)
	end

	def test_striaght_flush_winner
		winner = {"hand1" => "Straight Flush 10"}
		hand = {"hand1" => ["Ts", "9s", "6s", "8s","7s"]}
		assert_equal(winner,straight_flush(hand))
	end

	def test_face_changer
		face_value = []
		assert_equal(Array,face_changer(face_value).class)
	end

	def test_for_A_14
		hand = ["A", "9", "6", "8","7"]
		changed_hand = [14, 9, 6, 8,7]
		assert_equal(changed_hand,face_changer(hand))
	end

	def test_for_all_face_letters
		hand = ["A", "J", "Q", "K","T"]
		changed_hand = [14, 11, 12, 13, 10]
		assert_equal(changed_hand,face_changer(hand))
	end

	def test_four_of_a_kind
		hand = {"hand1" => ["2s", "2d", "2c", "2h","7s"]}
		assert_equal(Hash,four_of_a_kind(hand).class)
	end

	def test_for_four_of_a_kind
		winner = {"hand1" => "Winner Winner"}
		hand = {"hand1" => ["2s", "2d", "2c", "2h","7s"]}
		assert_equal(winner,four_of_a_kind(hand))
	end

	def test_three_of_a_kind
		hand = {"hand1" => ["4s", "4d", "4c", "2h","7s"]}
		assert_equal(Hash,three_of_a_kind(hand).class)
	end

	def test_for_three_of_a_kind
		winner = {"hand1" => "Winner Winner"}
		hand = {"hand1" => ["4s", "4d", "4c", "2h","7s"]}
		assert_equal(winner,three_of_a_kind(hand))
	end
end
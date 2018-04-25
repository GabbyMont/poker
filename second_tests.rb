require 'minitest/autorun'
require_relative 'second_pokerhand.rb'

class Poker_Hand_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_hash_class
		assert_equal(Hash,hand_builder().class)
	end

	def test_for_two_hands
		assert_equal(2, hand_builder.length)
	end

	def test_hand1_length
		hand_length1 = hand_builder()["hand1"]
		hand_length2 = hand_builder()["hand2"]
		assert_equal(5,hand_length1.length)
		assert_equal(5,hand_length2.length)
	end

	def test_no_duplicates
		hand1 = hand_builder()["hand1"]
		hand2 = hand_builder()["hand2"]
		assert_equal(hand1,hand1.uniq)
		assert_equal(hand2,hand2.uniq)
	end
end
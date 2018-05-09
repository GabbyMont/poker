require 'minitest/autorun'
require_relative 'second_pokerhand.rb'

class Poker_Hand_test < Minitest::Test
	# def test_true_is_true
	# 	assert_equal(true,true)
	# end

	# def test_hash_class
	# 	assert_equal(Hash,hand_builder().class)
	# end

	# def test_for_one_hands # Adjust later on to take two hands
	# 	assert_equal(2, hand_builder().length)
	# end

	# def test_compare_straights
	# 	assert_equal(true,compare_straights(4,3))
	# end

	# def test_compare_straights
	# 	assert_equal(false,compare_straights(2,3))
	# end

	# def test_hand1_length
	# 	hand_length1 = hand_builder()["hand1"]
	# 	hand_length2 = hand_builder()["hand2"]
	# 	assert_equal(5,hand_length1.length)
	# 	assert_equal(5,hand_length2.length)
	# end

	# def test_no_duplicates
	# 	hand1 = hand_builder()["hand1"]
	# 	hand2 = hand_builder()["hand2"]
	# 	assert_equal(hand1,hand1.uniq)
	# 	assert_equal(hand2,hand2.uniq)
	# end

	# def test_royal_flush_class
	# 	hand = ["Ad", "Kd", "Qd", "Jd","Td"]
	# 	assert_equal(TrueClass,royal_flush(hand).class)
	# end

	# def test_royal_true
	# 	hand = ["Ad", "Kd", "Qd", "Jd","Td"]
	# 	assert_equal(true,royal_flush(hand))
	# end

	# def test_royal_nil
	# 	hand = ["As", "Kd", "Qd", "Jd","Td"]
	# 	assert_nil(royal_flush(hand))
	# end

	# def test_straight_flush_class
	# 	hand = ["Ts", "9s", "7s", "8s","6s"]
	# 	assert_equal(TrueClass,straight_flush(hand).class)
	# end

	# def test_striaght_flush_true
	# 	hand = ["Ts", "9s", "7s", "8s","6s"]
	# 	assert_equal(true,straight_flush(hand))
	# end

	# def test_striaght_flush_nil
	# 	hand = ["Ts", "3d", "7s", "8s","6s"]
	# 	assert_nil(straight_flush(hand))
	# end

	# def test_face_changer
	# 	face_value = []
	# 	assert_equal(Array,face_changer(face_value).class)
	# end

	# def test_for_A_14_facechanger
	# 	hand = ["A", "9", "6", "8","7"]
	# 	changed_hand = [14, 9, 6, 8,7]
	# 	assert_equal(changed_hand,face_changer(hand))
	# end

	# def test_for_all_face_letters
	# 	hand = ["A", "J", "Q", "K","T"]
	# 	changed_hand = [14, 11, 12, 13, 10]
	# 	assert_equal(changed_hand,face_changer(hand))
	# end

	# def test_four_of_a_kind_class
	# 	hand = ["2s", "2d", "2c", "2h","7s"]
	# 	assert_equal(TrueClass,four_of_a_kind(hand).class)
	# end

	# def test_four_of_a_kind_true
	# 	hand = ["2s", "2d", "2c", "2h","7s"]
	# 	assert_equal(true,four_of_a_kind(hand))
	# end

	# def test_four_of_a_kind_nil
	# 	hand = ["2s", "2d", "2c", "4h","7s"]
	# 	assert_nil(four_of_a_kind(hand))
	# end

	# def test_three_of_a_kind_class
	# 	hand = ["4s", "4d", "4c", "2h","7s"]
	# 	assert_equal(TrueClass,three_of_a_kind(hand).class)
	# end

	# def test_three_of_a_kind_true
	# 	hand = ["4s", "4d", "4c", "2h","7s"]
	# 	assert_equal(true,three_of_a_kind(hand))
	# end

	# def test_for_three_of_a_kind_nil
	# 	hand = ["3s", "4d", "4c", "2h","7s"]
	# 	assert_nil(three_of_a_kind(hand))
	# end

	# def test_pair_hand_class
	# 	hand = ["4s", "4d", "5c", "2h","7s"]
	# 	assert_equal(TrueClass,pair(hand).class)
	# end

	# def test_pair_hand_true
	# 	hand = ["4s", "4d", "5c", "2h","7s"]
	# 	assert_equal(true,pair(hand))
	# end

	# def test_pair_hand_royal_faces
	# 	hand = ["Qs", "Qd", "5c", "2h","7s"]
	# 	changed_hand = [2, 5, 7, 12,12]
	# 	assert_equal(changed_hand,pair(hand))
	# end

	def test_pair_two_hands_royal_faces
		hand1 = ["Qs", "Qd", "5c", "2h","7s"]
		hand2 = ["Js", "Jd", "7c", "4h","2s"]
	  	hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand2 wins",hand_comparison(hands))
	end

	# def test_pair_hand_nil
	# 	hand = ["6s", "4d", "5c", "2h","7s"]
	# 	assert_nil(pair(hand))
	# end

	# def test_full_house_class
	# 	hand = ["Ts", "Td", "Tc", "9h","9s"]
	# 	assert_equal(TrueClass,full_house(hand).class)
	# end

	# def test_full_house_true
	# 	hand = ["Ts", "Td", "Tc", "9h","9s"]
	# 	assert_equal(true,full_house(hand))
	# end

	# def test_full_house_nil
	# 	hand = ["4s", "Td", "Tc", "9h","9s"]
	# 	assert_nil(full_house(hand))
	# end

	# def test_flush_class
	# 	hand = ["1s", "5s", "Ts","9s","7s"]
	# 	assert_equal(TrueClass,flush(hand).class)
	# end

	# def test_flush_true
	# 	hand = ["1s", "5s", "Ts", "9s","7s"]
	# 	assert_equal(true,flush(hand))
	# end

	# def test_flush_nil
	# 	hand = ["4d", "5s", "Ts", "9s","7s"]
	# 	assert_nil(flush(hand))
	# end

	# def test_flush_face_true
	# 	hand = ["Qs", "Ks", "Ts","Js","As"]
	# 	assert_equal(true,flush(hand))
	# end

	# def test_straight_class
	# 	hand = ["Td", "9s", "6c", "8s","7h"]
	# 	assert_equal(TrueClass,straight(hand).class)
	# end

	# def test_striaght_true
	# 	hand = ["Td", "9s", "6c", "8s","7h"]
	# 	assert_equal(true,straight(hand))
	# end

	# def test_striaght_nil
	# 	hand = ["2d", "9s", "6c", "8s","7h"]
	# 	assert_nil(straight(hand))
	# end

	# def test_two_pair_class
	# 	hand = ["4s", "4d", "2c", "2h","7s"]
	# 	assert_equal(TrueClass,two_pair(hand).class)
	# end

	# def test_two_pair_true
	# 	hand = ["4s", "4d", "2c", "2h","7s"]
	# 	assert_equal(true,two_pair(hand))
	# end

	# def test_two_pair_nil
	# 	hand = ["5s", "4d", "2c", "2h","7s"]
	# 	assert_nil(two_pair(hand))
	# end

	# def test_hand_comp_class
	# 	hands = {"hand1" => ["7h", "3d", "4d", "6s", "5s"],"hand2" => ["9h", "3d", "4d", "6s", "5h"]}
	# 	assert_equal(String,hand_comparison(hands).class)
	# end

	# def test_hand_comparison
	# 	hand1 = ["7h", "3d", "4d", "6s", "5s"]
	# 	hand2 = ["9h", "3d", "4d", "6s", "5h"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner", hand_comparison(hands))
	# end

	# def test_high_card_class
	# 	hand = ["7s", "3d", "4c", "5h","6s"]
	# 	assert_equal(TrueClass,high_card(hand).class)
	# end

	# def test_high_card_true
	# 	hand = ["7s", "4d", "3c", "5h","6s"]
	# 	assert_equal(true,high_card(hand))
	# end

	# def test_two_cards_for_royal_flush_winner
	# 	hand1 = ["Ad", "Kd", "Qd", "Jd","Td"]
	# 	hand2 = ["9h", "3d", "4d", "6s", "5h"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_two_straight_flushes
	# 	hand1 = ["Ad", "Kd", "Qd", "Jd","Td"]
	# 	hand2 = ["Ts", "9s", "7s", "8s","6s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_two_flushes
	# 	hand1 = ["1s", "5s", "Ts", "9s","7s"]
	# 	hand2 = ["Ts", "9s", "7s", "8s","6s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player Two is the winner",hand_comparison(hands))
	# end

	# def test_straight_win
	# 	hand1 = ["Ts", "9s", "7s", "8s","6s"]
	# 	hand2 = ["As", "9s", "7s", "8s","6s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_str_win_not_four_win
	# 	hand1 = ["Ts", "9s", "7s", "8s","6s"]
	# 	hand2 = ["2s", "2d", "2c", "4h","7s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_four_of_a_kind_tie
	# 	hand1 = ["2s", "2d", "2c", "2h","7s"]
	# 	hand2 = ["2s", "2d", "2c", "2h","7s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal(20,hand_comparison(hands))
	# end

	# def test_fullhouse_win
	# 	hand1 = ["2s", "9s", "9c", "8s","6s"]
	# 	hand2 = ["Js", "Jd", "Jc", "Th","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player Two is the winner",hand_comparison(hands))
	# end

	# def test_fullhouse_tie
	# 	hand1 = ["9s", "9h", "9c", "8d","8s"]
	# 	hand2 = ["Js", "Jd", "Jc", "Th","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal(50,hand_comparison(hands))
	# end

	# def test_flush_winner
	# 	hand1 = ["2d", "9d", "3d", "6d","8d"]
	# 	hand2 = ["Js", "Jd", "Jc", "8h","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_two_pair_win_against
	# 	hand1 = ["9s", "9h", "Tc", "4d","8s"]
	# 	hand2 = ["Js", "Jd", "8c", "Th","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player Two is the winner",hand_comparison(hands))
	# end

	# def test_two_pair_win_against
	# 	hand1 = ["9s", "9h", "Tc", "4d","8s"]
	# 	hand2 = ["Js", "Jd", "8c", "Th","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player Two is the winner",hand_comparison(hands))
	# end

	# def test_hand_two_high_card
	# 	hand1 = ["2s", "9h", "4d", "3s","6c"]
	# 	hand2 = ["Js", "2d", "6c", "8h","Ts"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal(20,hand_comparison(hands))
	# end

	# def test_tiebreaker_in_handcomp
	# 	hand1 = ["9s", "5s", "7s", "8s","6s"]
	# 	hand2 = ["2d", "3d", "4d", "5d","6d"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal(20,hand_comparison(hands))
	# end

	# def test_evaluate_hands
	# 	hand2 = ["Td", "9s", "6c", "8s","7h"]
	# 	hand1 = ["2d", "3d", "4s", "5d","6d"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("hand2 wins",hand_comparison(hands))
	# end

	# def test_pair_tiebreaker_hand1
	# 	hand1 = ["4s", "7d", "5c", "2h","7s"]
	# 	hand2 = ["2s", "4d", "5c", "2h","7s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player One is the winner",hand_comparison(hands))
	# end

	# def test_pair_tiebreaker_hand1
	# 	hand1 = ["4s", "7d", "5c", "2h","2s"]
	# 	hand2 = ["2s", "8d", "8c", "2h","7s"]
	# 	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("Player Two is the winner",hand_comparison(hands))
	# end

	# def test_pair_tiebreaker_hand2_winner
	# 	hand1 = ["4s", "6d", "6c", "2h","7s"]
	# 	hand2 = ["9s", "9h", "2c", "4d","8s"]
	# 	assert_equal("hand2 wins",look_at_tie(hand1,hand2))
	# end

	# def test_pair_tie_breaker_hand2_winner
	# 	hand1 = ["Qs", "6d", "Qc", "2h","7s"]
	# 	# hand1_c = [12, 6, 12, 2,7]
	# 	hand2 = ["Ks", "Kh", "2c", "4d","8s"]
	# 	hand2_c = [13, 13, 2, 4,8]
	#  	hands = {"hand1" => hand1,"hand2" => hand2}
	# 	assert_equal("hand2 wins",hand_comparison(hands))
	# end
end
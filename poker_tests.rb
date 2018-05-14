require 'minitest/autorun'
require_relative 'pokerhand.rb'

class Poker_Hand_test < Minitest::Test
	def test_true_is_true
		assert_equal(true,true)
	end

	def test_hash_class
		assert_equal(Hash,hand_builder().class)
	end

	def test_for_one_hands # Adjust later on to take two hands
		assert_equal(2, hand_builder().length)
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

	def test_royal_flush_class
		hand = ["Ad", "Kd", "Qd", "Jd","Td"]
		assert_equal(TrueClass,royal_flush(hand).class)
	end

	def test_royal_true
		hand = ["Ad", "Kd", "Qd", "Jd","Td"]
		assert_equal(true,royal_flush(hand))
	end

	def test_striaght_flush_true
		hand = ["Ts", "9s", "7s", "8s","6s"]
		assert_equal(true,straight_flush(hand))
	end

	def test_striaght_flush_separator
		hand = ["Ts", "9s", "7s", "8s","6s"]
		assert_equal(true,straight_flush(hand))
	end

	def test_face_changer
		face_value = []
		assert_equal(Array,face_changer(face_value).class)
	end

	def test_for_A_14_facechanger
		hand = ["A", "9", "6", "8","7"]
		changed_hand = [14, 9, 6, 8,7]
		assert_equal(changed_hand,face_changer(hand))
	end

	def test_for_all_face_letters
		hand = ["A", "J", "Q", "K","T"]
		changed_hand = [14, 11, 12, 13, 10]
		assert_equal(changed_hand,face_changer(hand))
	end

	def test_pair_two_hands_royal_faces
		hand1 = ["Qs", "Qd", "5c", "2h","7s"]
		hand2 = ["Js", "Jd", "7c", "4h","2s"]
	  	hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 wins",hand_comparison(hands))
	end

	def test_pair_two_hands_same_matches
		hand2 = ["Qs", "Qd", "5c", "2h","7s"]
		hand1 = ["Js", "8d", "7c", "Qh","Qs"]
	  	hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_pair_two_hands_royal_faces_look_at_tie
		hand1 = ["Qs", "Qd", "5c", "2h","7s"]
		hand2 = ["Js", "Jd", "7c", "4h","2s"]
		assert_equal("hand1 wins",look_at_tie(hand1,hand2))
	end

	def test_pair_hand_nil
		hand = ["6s", "4d", "5c", "2h","7s"]
		assert_nil(pair(hand))
	end

	def test_full_house_class
		hand = ["Ts", "Td", "Tc", "9h","9s"]
		assert_equal(TrueClass,full_house(hand).class)
	end

	def test_full_house_true
		hand = ["Ts", "Td", "Tc", "9h","9s"]
		assert_equal(true,full_house(hand))
	end

	def test_full_house_separate_hands
		hand1 = ["Qs", "Qd", "Qc", "7h","7s"]
		hand2 = ["8s", "Js", "7s", "4s","2s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_full_house_nil
		hand = ["4s", "Td", "Tc", "9h","9s"]
		assert_nil(full_house(hand))
	end

	def test_straight_class
		hand = ["Td", "9s", "6c", "8s","7h"]
		assert_equal(TrueClass,straight(hand).class)
	end

	def test_striaght_true
		hand = ["Td", "9s", "6c", "8s","7h"]
		assert_equal(true,straight(hand))
	end

	def test_striaght_nil
		hand = ["2d", "9s", "6c", "8s","7h"]
		assert_nil(straight(hand))
	end

	def test_two_pair_class
		hand = ["4s", "4d", "2c", "2h","7s"]
		assert_equal(TrueClass,two_pair(hand).class)
	end

	def test_two_pair_true
		hand = ["4s", "4d", "2c", "2h","7s"]
		assert_equal(true,two_pair(hand))
	end

	def test_two_pair_nil
		hand = ["5s", "4d", "2c", "2h","7s"]
		assert_nil(two_pair(hand))
	end

	def test_hand_comp_class
		hands = {"hand1" => ["7h", "3d", "4d", "6s", "5s"],"hand2" => ["9h", "3d", "4d", "6s", "5h"]}
		assert_equal(String,hand_comparison(hands).class)
	end

	def test_hand_comparison
		hand1 = ["7h", "3d", "4d", "6s", "5s"]
		hand2 = ["9h", "3d", "4d", "6s", "5h"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner", hand_comparison(hands))
	end

	def test_high_card_class
		hand = ["7s", "3d", "4c", "5h","6s"]
		assert_equal(TrueClass,high_card(hand).class)
	end

	def test_high_card_true
		hand = ["7s", "4d", "3c", "5h","6s"]
		assert_equal(true,high_card(hand))
	end

	def test_two_cards_for_royal_flush_winner
		hand1 = ["Ad", "Kd", "Qd", "Jd","Td"]
		hand2 = ["9h", "3d", "4d", "6s", "5h"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_two_straight_flushes
		hand1 = ["Ad", "Kd", "Qd", "Jd","Td"]
		hand2 = ["Ts", "9s", "7s", "8s","6s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_two_flushes
		hand1 = ["1s", "5s", "Ts", "9s","7s"]
		hand2 = ["Ts", "9s", "7s", "8s","6s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player Two is the winner",hand_comparison(hands))
	end

	def test_straight_win
		hand1 = ["Ts", "9s", "7s", "8s","6s"]
		hand2 = ["As", "9s", "7s", "8s","6s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_str_win_not_four_win
		hand1 = ["Ts", "9s", "7s", "8s","6s"]
		hand2 = ["2s", "2d", "2c", "4h","7s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_four_of_a_kind_tie
		hand1 = ["2s", "2d", "2c", "2h","7s"]
		hand2 = ["2s", "2d", "3c", "2h","7s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player One is the winner",hand_comparison(hands))
	end

	def test_fullhouse_win
		hand1 = ["2s", "9s", "9c", "8s","6s"]
		hand2 = ["Js", "Jd", "Jc", "Th","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player Two is the winner",hand_comparison(hands))
	end

	def test_fullhouse_tie
		hand1 = ["9s", "9h", "9c", "8d","8s"]
		hand2 = ["Js", "Jd", "Jc", "Th","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand2 wins",hand_comparison(hands))
	end
	
	def test_two_pair_win_against_one_pair
		hand1 = ["9s", "9h", "Tc", "4d","8s"]
		hand2 = ["Js", "Jd", "8c", "Th","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player Two is the winner",hand_comparison(hands))
	end

	def test_two_pair_win_against
		hand1 = ["9s", "9h", "Tc", "4d","8s"]
		hand2 = ["Js", "Jd", "8c", "Th","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player Two is the winner",hand_comparison(hands))
	end

	def test_hand_two_high_card
		hand1 = ["2s", "9h", "4d", "3s","6c"]
		hand2 = ["Js", "2d", "6c", "8h","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand2 is the winner",hand_comparison(hands))
	end

	def test_tiebreaker_in_handcomp
		hand1 = ["9s", "5s", "7s", "8s","6s"]
		hand2 = ["2d", "3d", "4d", "5d","6d"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 is the winner" ,hand_comparison(hands))
	end

	def test_pair_tiebreaker_hand1
		hand1 = ["4s", "7d", "5c", "2h","7s"]
		hand2 = ["2s", "4d", "5c", "2h","7s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 wins",hand_comparison(hands))
	end

	def test_pair_look_at_tie_hand1 
		hand1 = ["4s", "7d", "5c", "2h","2s"]
		hand2 = ["2s", "8d", "8c", "2h","7s"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("Player Two is the winner",hand_comparison(hands))
	end

	def test_pair_tiebreaker_hand2_winner
		hand1 = ["4s", "6d", "6c", "2h","7s"] # 25
		hand2 = ["9s", "9h", "2c", "4d","8s"] # 32
		assert_equal("hand2 wins",look_at_tie(hand1,hand2))
	end

	def test_evaluate_hands
		hand2 = ["Td", "9s", "6c", "8s","7h"]
		hand1 = ["2d", "3d", "4s", "5d","6d"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand2 is the winner",hand_comparison(hands))
	end

	def test_fullhouse_tie
		hand1 = ["4d", "4s", "4c", "2s","2h"] # 6
		hand2 = ["3s", "3d", "3s", "2d","2h"] # 5
		assert_equal("hand1 wins",look_at_tie(hand1,hand2))
	end

	def test_two_pair_tie_breaker
		hand1 = ["4s", "4d", "2c", "2h","7s"] # 6
		hand2 = ["3s", "3d", "9s", "2d","2h"] # 5
		assert_equal("hand1 wins",look_at_tie(hand1,hand2))
	end

	def test_fullhouse_hand_comparison
		hand1 = ["4d", "4s", "4c", "2s","2h"]
		hand2 = ["3s", "3d", "3s", "2d","2h"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 wins",hand_comparison(hands))
	end

	def test_hand_comparison_two_pair_tie
		hand1 = ["5h", "5c", "3d", "2s", "2d"]
		hand2 = ["7h", "4c", "4d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 wins",hand_comparison(hands))
	end

	def test_hand_comparison_royal_full_house_tie
        hand1 = ["Qh", "Qc", "Qd", "2s", "2d"]
        hand2 = ["Jh", "Jc", "Jd", "2s", "2d"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("hand1 wins",hand_comparison(hands))
    end

    def test_hand_comparison_royal_two_pair_tie
        hand1 = ["Qh", "Qc", "7d", "2s", "2d"]
        hand2 = ["Jh", "Jc", "6d", "2s", "2d"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("hand1 wins",hand_comparison(hands))
    end

    def test_hand_comparison_straight_flush_tie
        hand1 = ["3h", "4h", "5h", "6h", "7h"]
        hand2 = ["2d", "3d", "4d", "5d", "6d"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("hand1 is the winner",hand_comparison(hands))
    end

    def test_hand_comparison_straight_tie
        hand1 = ["7h", "6c", "5d", "4s", "3d"]
        hand2 = ["2h", "3c", "4h", "5s", "6d"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("hand1 is the winner",hand_comparison(hands))
    end

    def test_hand_comparison_flush_tie
        hand1 = ["2d", "4d", "9d", "5d", "6d"]
        hand2 = ["2h", "3h", "4h", "5h", "8h"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("hand1 is the winner",hand_comparison(hands))
    end

    def test_hand_comparison_one_pair_tie
        hand1 = ["7h", "7d", "5h", "6h", "9h"]
        hand2 = ["7h", "7d", "3h", "2d", "9h"]
        assert_equal("Hand1 is the winner",look_at_tie(hand1,hand2))
    end

    def test_look_at_tie_one_pair_tie_kicker_card_tie
        hand1 = ["7s", "7c", "4h", "6h", "9h"]
        hand2 = ["7h", "7d", "5h", "3d", "9h"]
        assert_equal("Hand1 is the winner",look_at_tie(hand1,hand2))
    end

    def test_look_at_one_pair_kicker_card_hand1_winner
        hand1 = ["7s", "7c", "4h", "6h", "9h"]
        hand2 = ["7h", "7d", "5h", "3d", "8h"]
        assert_equal("hand1 is the winner",look_at_tie(hand1,hand2))
    end

    def test_three_of_a_kind_beats_a_pair
    	hand1 = ["2h", "2s", "2d", "4s", "3d"]
        hand2 = ["8h", "4c", "4h", "5s", "6d"]
        hands = {"hand1" => hand1, "hand2" => hand2}
        assert_equal("Player One is the winner",hand_comparison(hands))
    end
end
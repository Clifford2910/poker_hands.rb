# Evaluates poker hands for validity and determines the winning hand
require_relative 'poker_hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @hands_list = []
  end

  def hand_classifications
    @hands.each do |hand|
      result = PokerHand.new(hand).calculate_hand
      @hands_list.push(result)
    end
    @hands_list
  end
end

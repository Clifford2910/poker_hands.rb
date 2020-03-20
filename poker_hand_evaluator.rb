# Evaluates poker hands for validity and determines the winning hand
require_relative 'poker_hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @hands_list = []
  end

  def hand_classifications
    result = PokerHand.new(@hands[0]).calculate_hand
    @hands_list.push(result)
  end
end

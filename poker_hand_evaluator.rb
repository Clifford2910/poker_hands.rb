# Evaluates poker hands for validity and determines the winning hand
class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @hands_list = []
  end

  def hand_classifications
    @hands_list.push('HIGH_CARD')
  end

end

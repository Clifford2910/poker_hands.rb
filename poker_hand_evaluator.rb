# Evaluates poker hands for validity and determines the winning hand
require_relative 'poker_hand'
require_relative 'custom_error'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @hands_list = []
  end

  def hand_classifications
    # handle_errors
    @hands.each do |hand|
      result = PokerHand.new(hand).calculate_hand
      @hands_list.push(result)
    end
    @hands_list
  end

  private

  def handle_errors
    @hands.each do |hand|
      cards = hand.split(' ')
      raise InvalidHandError.new('too many cards') if cards.length > 5
      raise InvalidHandError.new('too few cards') if cards.length < 5
      raise InvalidHandError.new('two of the same card in one hand') if cards.uniq.length != 5
    end
    all_cards = @hands.join(' ')
    card_array = all_cards.split(' ')
    raise InvalidHandError.new('two of the same card in seperate hands') if card_array.uniq.length != card_array.length
  end

end

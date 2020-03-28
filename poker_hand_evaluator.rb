# Evaluates poker hands for validity and determines the winning hand
require_relative 'poker_hand'

class PokerHandEvaluator
  class InvalidHandError < StandardError
    attr_reader :message

    def initialize(message)
      @message = message
    end
  end

  def initialize(hands)
    @hands = hands
    @hands_list = []
    handle_errors
  end

  def hand_classifications
    @hands.each do |hand|
      result = PokerHand.new(hand).calculate_hand
      @hands_list.push(result)
    end
    @hands_list
  end

  private

# methods separated out from code for reuseability and to keep code dry

  def handle_errors
    @hands.each do |hand|
      hand_cards = hand.split(' ')
      raise InvalidHandError.new('too many cards in one hand') if hand_cards.length > 5
      raise InvalidHandError.new('too few cards in one hand') if hand_cards.length < 5
      raise InvalidHandError.new('two of the same card in one hand') if hand_cards.uniq.length != 5
    end
    all_cards = @hands.join(' ')
    all_cards_array = all_cards.split(' ')
    raise InvalidHandError.new('two of the same card in seperate hands') if all_cards_array.uniq.length != all_cards_array.length
  end

end

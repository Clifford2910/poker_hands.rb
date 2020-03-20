class PokerHand

  def initialize(cards)
    @cards = cards.split
    @ranks = []
  end

  CARD_RANKS = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "0" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14,
  }

  def calculate_hand
    if pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end

  def pair?
    separate_ranks
    pairs_of_cards = @ranks.select { |rank| @ranks.count(rank) == 2 }.uniq
    pairs_of_cards.length == 1
  end

  private

  def separate_ranks
    @cards.each do |card|
      @ranks.push(CARD_RANKS[card[0]])
    end
  end

end

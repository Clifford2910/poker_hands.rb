class PokerHand

  def initialize(cards)
    @cards = cards.split
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
    case
    when pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end

  def pair?
    ranks = []
    @cards.each do |card|
      ranks.push(CARD_RANKS[card[0]])
    end
    pairs_of_cards = ranks.select { |rank| ranks.count(rank) == 2 }.uniq
    pairs_of_cards.length == 1
  end
end

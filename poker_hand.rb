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
    if three_of_a_kind?
      'THREE_OF_A_KIND'
    elsif two_pair?
      'TWO_PAIR'
    elsif pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end

  private

# methods separated out from code for reuseability and to keep code dry

  def three_of_a_kind?
    separate_ranks
    three_of_a_kind = @ranks.select { |rank| @ranks.count(rank) == 3 }.uniq
    three_of_a_kind.length == 1
  end

  def two_pair?
    separate_ranks
    pairs = @ranks.select { |rank| @ranks.count(rank) == 2 }.uniq
    pairs.length == 2
  end

  def pair?
    separate_ranks
    pairs = @ranks.select { |rank| @ranks.count(rank) == 2 }.uniq
    pairs.length == 1
  end

  def separate_ranks
    @cards.each do |card|
      @ranks.push(CARD_RANKS[card[0]])
    end
  end

end

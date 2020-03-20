class PokerHand

  def initialize(cards)
    @cards = cards.split
    @ranks = []
    @suits = []
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
    separate_ranks
    separate_suits
    if royal_flush?
      'ROYAL_FLUSH'
    elsif straight_flush?
      'STRAIGHT_FLUSH'
    elsif flush?
      'FLUSH'
    elsif straight?
      'STRAIGHT'
    elsif four_of_a_kind?
      'FOUR_OF_A_KIND'
    elsif full_house?
      'FULL_HOUSE'
    elsif three_of_a_kind?
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

  def royal_flush?
    straight_flush? && @ranks.sum == 60
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    if @ranks == [2, 3, 4, 5, 14]
      @ranks = [1, 2, 3, 4, 5]
    end
    @ranks.each_cons(2).all? { |x,y| x == y - 1 }
  end

  def flush?
    flush = @suits.select { |suit| @suits.count(suit) == 5 }.uniq
    flush.length == 1
  end

  def four_of_a_kind?
    four_of_a_kind = @ranks.select { |rank| @ranks.count(rank) == 4 }.uniq
    four_of_a_kind.length == 1
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def three_of_a_kind?
    three_of_a_kind = @ranks.select { |rank| @ranks.count(rank) == 3 }.uniq
    three_of_a_kind.length == 1
  end

  def two_pair?
    pairs = @ranks.select { |rank| @ranks.count(rank) == 2 }.uniq
    pairs.length == 2
  end

  def pair?
    pairs = @ranks.select { |rank| @ranks.count(rank) == 2 }.uniq
    pairs.length == 1
  end

  def separate_ranks
    @cards.each do |card|
      @ranks.push(CARD_RANKS[card[0]])
    end
    @ranks.sort!
  end

  def separate_suits
    @cards.each do |card|
      @suits.push(card[1])
    end
  end

end

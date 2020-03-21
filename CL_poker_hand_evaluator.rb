require_relative 'poker_hand_evaluator'

def poker_hand_converter
  inputted_hand = ARGV
  puts "You inputted: "
  if ARGV.empty?
    puts 'Nothing...'
  elsif ARGV.any?
    inputted_hand.each do |hand|
      puts hand
    end
    puts 'Results:'
    converter = PokerHandEvaluator.new(ARGV)
    puts converter.hand_classifications
  end

end

poker_hand_converter

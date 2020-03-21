class InvalidHandError < StandardError
  attr_reader :message

  def initialize(message)
    @message = message
  end
end

begin
  raise InvalidHandError.new("message")
rescue InvalidHandError => e
  # puts e.message
end

class LinkedListItem
  include Comparable
  attr_reader :payload
  attr_reader :next_item

  def initialize(payload)
    @payload = payload
  end

  def last?
    next_item.nil?
  end

  def next_item=(lli)
    raise ArgumentError if self == lli
    @next_item = lli
  end

  def <=>(other)
    self.payload.to_s <=> other.payload.to_s
  end
end

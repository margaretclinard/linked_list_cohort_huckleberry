class LinkedListItem
  include Comparable
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  attr_reader :next_item
  def next_item=(next_item)
    if next_item == self
      raise ArgumentError
    else
      @next_item = next_item
    end
  end
end

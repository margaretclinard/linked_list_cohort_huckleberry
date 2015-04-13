class LinkedListItem
  include Comparable
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end
end

require_relative 'linked_list_item'

class LinkedList

  attr_reader :first_item, :size

  def initialize
    @size = 0
  end

  def push(payload)
    if @first_item.nil?
      @first_item = LinkedListItem.new(payload)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(payload)
      @last_item = @last_item.next_item
    end
    @size += 1
  end

  def get(index)
    raise IndexError if index < 0 || index > @size
    if index == 0
      @first_item.payload
    else
      current_node = @first_item
      index.times do
        current_node = current_node.next_item
      end
      current_node.payload
    end
  end

  def last
    if ! @last_item.nil?
      @last_item.payload
    end
  end

  def to_s
    output = ""
    if @first_item.nil?
      output << "| |"
    else
      (@size - 1).times do |i|
        output << "#{get(i)}, "
      end
      output << "#{@last_item.payload} "
      return "| #{output}|"
    end
  end
end

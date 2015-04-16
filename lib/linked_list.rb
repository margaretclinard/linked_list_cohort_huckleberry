require_relative 'linked_list_item'

class LinkedList

  attr_reader :first_item
  #def size
    #@size = 0
  #end

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
  end

  def get(index)
    raise IndexError if index < 0 || @first_item == nil
    if index == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < index
      # above is the same as while count <= index - 1
        current_node = current_node.next_item
        count = count + 1
      end
      current_node.payload
    end
  end
end

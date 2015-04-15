class LinkedList

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
    if index == 0
      @first_item.payload
    elsif index < 0
      raise IndexError
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

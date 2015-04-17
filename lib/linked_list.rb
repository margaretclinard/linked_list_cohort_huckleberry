require_relative 'linked_list_item'

class LinkedList

  attr_reader :first_item, :size

  def initialize(*payload)
    @size = 0
    payload.each { |payload| push(payload) }
  end

  def [] (index)
    get(index)
  end

  def []=(index, new_item)
    current_node = @first_item
    index.times do
      current_node = current_node.next_item
    end
    current_node.payload = new_item
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

    # Refactored code:
    # new_item = LinkedListItem.new(payload)
    # if @first_item.nil?
    #   @first_item = new_item
    # else
    #   last_item = @first_item
    #   until last_item.last?
    #     last_item = last_item.next_item
    #   end
    # end
    # last_item.next_item = new_item
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

  # Option 1 for size method:
  #def size
    #current_item = @first_item
    #size = 0
    #until current_item.nil?
      #current_item = current_item.next_item
      #size += 1
    #end
    #size
    #end
  #end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def to_s
    # Refactored Code:
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item
    end
    str << "|"
    str

    # First Draft:
    #output = ""
    #if @first_item.nil?
      #output << "| |"
    #else
      #(@size - 1).times do |i|
        #output << "#{get(i)}, "
      #end
      #output << "#{@last_item.payload} "
      #return "| #{output}|"
    #end

    # Inefficient code example:
    #str = "| "
    #size.times do |i|
      #str << get(i)
      #if i == (size - 1)
        #str << " "
      #else
        #str << ", "
      #end
    #end
    #str << "|"
    #str
  end

  def delete(index)
    current_node = @first_item
    if index > 0
     (index - 1).times do
        current_node = current_node.next_item
      end
      current_node.next_item = current_node.next_item.next_item
    elsif index <= 0
      @first_item = current_node.next_item
    end
    @size -= 1
  end
end

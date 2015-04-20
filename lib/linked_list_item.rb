class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_item

  def initialize(payload)
    @payload = payload
  end

  def last?
    next_item.nil?
  end

  def next_item=(lli)
    raise ArgumentError if self === lli
    @next_item = lli
  end

  # self less than other    => -1
  # self equal to other     => 0
  # self greater than other => 1

  def <=>(other)
    # CLASS DRAFT
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    end
    # One liner option = self.payload.class.to_s <=> other.payload.class.to_s
    if self.payload.is_a? Symbol
      1
    elsif self.payload.is_a? Fixnum
      -1
    else # I must be a string
      if other.payload.is_a? Symbol
        -1
      else
        1
      end
    end

    # ARRAY OPTION
    #class_precedence = [Fixnum, String, Symbol]
    #left_precedence = class_precedence.index(self.payload.class)
    #right_precedence = class_precedence.index(other.payload.class)
    #left_precedence <=> right_precedence

    # The below is the same as self.payload <=> other.payload
    #if self.payload == other.payload
      #0
    #elsif self.payload > other.payload
      #-1
    #else
      #1
    #end

    # DRAFT 1:
    #compare = self.payload <=> other.payload
    #if compare == nil
      #if self.payload.class == Symbol && other.payload.class == String
        #compare = 1
      #elsif self.payload.class == String && other.payload.class == Symbol
        #compare = -1
      #end
      #if self.payload.class == Fixnum && other.payload.class == String
        #compare = -1
      #elsif self.payload.class == String && other.payload.class == Fixnum
        #compare = 1
      #end
    #end
    #compare
  end

  def ===(other)
    self.equal? other
  end
end

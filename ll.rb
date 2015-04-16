#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
# TODO: Push all the items from the array into the LinkedList
payloads.each do |payload|
  ll.push payload
end

# Then, print it out

print "* -> "

payloads.size.times do |i|
  print "#{ll.get(i).inspect} -> "
end

print "nil"

# BRENNAN AND MC SOLUTION
#if payloads.size >= 1
  #print "* -> #{payloads.map(&:inspect).join(' -> ')} -> nil"
#else
  #print "* -> #{payloads.join(" -> ")}nil"
#end

#Doesn't exactly work...
require 'pry'

module Calculator
  # retuns  0 if empty
  #if negatives added, calls in negatives_added method, to give message
  #combines all elements specified by a block
  def self.add(numbers)
    return 0 if empty?
    raise negatives_added
    numbers.inject {|sum, n| sum + n } #found inject in Ruby enumerables doc
  end
  
  #returns a message if negatives were added, plus shows those negative numbers separated by an '&' sign
  def negatives_added
    raise "Negatives not allowed: #{negatives.join(' & ')}" unless negatives.empty?
  end
  
  #method for determining if a number is less than zero, i.e. negative
  #a ||= b is same as: a || a = b. It means "if a is false, nil or undefined, then evaluate b and set a to the result".Found on SO
  def negatives 
    negatives ||= numbers.select {|num| num < 0}
  end
  
  #allows the add method to handle new lines between numbers
  def numbers
    gsub(/[^\n]/, '').split#.map {|x| x.to_i} #found gsub in Ruby documentation, for handling new lines between numbers. map in array doc
end
end

binding.pry
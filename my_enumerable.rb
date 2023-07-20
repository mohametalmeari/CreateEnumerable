# module MyEnumerable
#   def all?(&block)
#     @list.each { |item| return false unless yield(item) }
#     true
#   end

#   def any?(&block)
#     @list.each { |item| return true if yield(item) }
#     false
#   end

#   def filter(&block)
#     result = []
#     @list.each { |item| result << item if yield(item) }
#     result.to_s
#   end
# end

## or:

# module MyEnumerable
#   def all?(&block)
#     @list.each { |item| return false unless block.yield(item) }
#     true
#   end

#   def any?(&block)
#     @list.each { |item| return true if block.yield(item) }
#     false
#   end

#   def filter(&block)
#     result = []
#     @list.each { |item| result << item if block.yield(item) }
#     result.to_s
#   end
# end

## or:

# module MyEnumerable
#   def all?(&block)

#     # for each item in the list array, call the block passed 
#     # to the all? method by assigning e = item, if all calls 
#     # are false return true after the loop, unless one call 
#     # is true then return false
#     @list.each { |item| return false unless block.call(item) } 
#     true
#   end

#   def any?(&block)

#     # for each item in the list array, call the block passed 
#     # to the any? method by assigning e = item, if all calls 
#     # are false return false after the loop, unless one call 
#     # is true then return true
#     @list.each { |item| return true if block.call(item) }
#     false
#   end

#   def filter(&block)
#     result = []

#     # for each item in the list array, call the block passed
#     # to the filter method by assigning e = item, if a call is
#     # true then push the item to the result, else do nothing,
#     @list.each { |item| result << item if block.call(item) }
#     # then return the result array as a string
#     result.to_s # similar to result.inspect
#   end

#   # # or: 
#   # def filter(&block)
#   #   @list.select(&block).to_s
#   # end
# end

#or: the regular way

module MyEnumerable
  def all?(&block)
    @list.each do |item|
      if !block.call(item)
        return false
      end
    end
    true
  end

  def any?(&block)
    @list.each do |item|
      if block.call(item)
        return true
      end
    end
    false
  end

  def filter(&block)
    result = []
    @list.each do |item|
      if block.call(item)
        result.push(item)
      end
    end
    result.inspect 
  end
end


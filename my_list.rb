require_relative 'my_enumerable'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end
end

list = MyList.new(1, 2, 3, 4)
puts list.all? { |e| e < 5 }
puts list.all? { |e| e > 5 }
puts list.any? { |e| e == 2 }
puts list.any? { |e| e == 5 }
puts list.filter { |e| e.even? }

# # Use proc to reserve a block in a variable then call it 
# # using .yield or .call methods on the variable by passing
# # values for the block arguments 
# block = proc { |a, b| a + b < 5 }
# puts block.yield(3, 4)
# # or:
# puts block.call(1, 2)


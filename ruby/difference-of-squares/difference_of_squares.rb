# Find the difference between the square of the sum and the sum of the squares
# of the first N natural numbers.

# Hence the difference between the square of the sum of the first ten natural
# numbers and the sum of the squares of the first ten natural numbers is
# 3025 - 385 = 2640.
class Squares
  attr_reader :limit
  def initialize(limit)
    @limit = limit
  end

  def square_of_sum
    (1..limit).to_a.reduce(:+)**2
  end

  def sum_of_squares
    sum = 0
    (1..limit).each do |number|
      sum += number**2
    end
    sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

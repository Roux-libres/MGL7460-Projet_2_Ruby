# frozen_string_literal: true

# Class simpleNumber
class SimpleNumber
  def initialize(num)
    raise unless num.is_a?(Numeric)

    @x = num
  end

  def add(number)
    @x + number
  end

  def multiply(number)
    @x * number
  end
end

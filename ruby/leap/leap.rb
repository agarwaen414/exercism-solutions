# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     unless the year is also evenly divisible by 400
class Year
  def self.leap?(year)
    if (year % 4).zero?
      if !(year % 400).zero? & (year % 100).zero?
        false
      else
        true
      end
    else
      false
    end
  end
end

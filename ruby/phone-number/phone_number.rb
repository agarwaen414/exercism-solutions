# cleans up user-entered phone numbers so that they can be sent SMS messages
class PhoneNumber
  def to_s
    numbers = number.scan(/\d/)
    format '(%3s) %3s-%4s', area_code, numbers[3, 3].join, numbers[6, 4].join
  end

  def area_code
    numbers = number.scan(/\d/)
    format '%3s', numbers[0, 3].join
  end

  def self.clean(number)
    digits = number.gsub(/[^\d]/, '')
    case
    when digits.match(/\D/)
      nil
    when digits.length == 10 && valid?(digits)
      digits
    when digits.length == 11 && digits[0] == '1' && valid?(digits[1..-1])
      digits[1..-1]
    else
      nil
    end
  end

  private

  def self.valid?(digits)
    if (2..9) === digits[0].to_i && (2..9) === digits[3].to_i
      true
    else
      false
    end
  end
end

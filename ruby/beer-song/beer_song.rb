# Recite the lyrics to that beloved classic, that field-trip favorite: 99 Bottles of Beer on the Wall.

# Note that not all verses are identical.
class BeerSong
  def self.recite(beginning, count = 1)
    verses(beginning, count)
  end

  def self.verses(beginning, count)
    result = ''
    beginning.downto(beginning - count + 1) do |number|
      first_line = "#{number} bottles of beer on the wall, #{number} bottles of beer."
      first_line = "1 bottle of beer on the wall, 1 bottle of beer." if number == 1
      first_line = "No more bottles of beer on the wall, no more bottles of beer." if number == 0
      second_line = "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
      second_line = "Take one down and pass it around, 1 bottle of beer on the wall." if number == 2
      second_line = "Take it down and pass it around, no more bottles of beer on the wall." if number == 1
      second_line = "Go to the store and buy some more, 99 bottles of beer on the wall." if number == 0
      result << "#{first_line}\n#{second_line}\n\n"
    end
    result
  end

  private_class_method :verses
end

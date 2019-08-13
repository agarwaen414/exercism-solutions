# Given a phrase, count the occurrences of each word in that phrase.

# For example for the input "olly olly in come free"

# olly: 2
# in: 1
# come: 1
# free: 1
class Phrase
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    whitespace = /'\s|\s'|\s{2,}/
    values = phrase.strip.gsub(whitespace, ' ').downcase.split(/[^a-zA-Z'0-9]+/)
    hash = {}
    values.map { |word| hash[word] = values.count(word) }
    hash
  end
end

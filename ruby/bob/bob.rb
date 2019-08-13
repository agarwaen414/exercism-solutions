# Bob is a lackadaisical teenager. In conversation, his responses are limited.

# Bob answers 'Sure.' if you ask him a question.

# He answers 'Whoa, chill out!' if you yell at him.

# He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

# He says 'Fine. Be that way!' if you address him without saying anything.

# He answers 'Whatever.' to anything else.
class Bob
  def self.hey(phrase)
    mask = " \t\n\r\0\x0B\u{00a0}\u{2002}"
    trimmed = phrase.gsub(mask, '').strip

    response(trimmed)
  end

  class << self
    private

    def response(phrase)
      calm_resp = "Calm down, I know what I'm doing!"
      result = 'Whatever.'
      result = 'Sure.' if phrase =~ /\D*\?\z/
      result = 'Whoa, chill out!' if yelling?(phrase)
      result = 'Fine. Be that way!' if phrase.empty?
      result = calm_resp if phrase =~ /^(?=[^a-z]*\?$).*[A-Z]/
      result
    end

    def yelling?(phrase)
      trimmed = phrase.gsub(/(\W|\d)/, '')
      if trimmed.empty?
        false
      elsif trimmed =~ /^[A-Z]*$/
        true
      else
        false
      end
    end
  end
end

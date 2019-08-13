# Convert a phrase to its acronym.

# Techies love their TLA (Three Letter Acronyms)!

# Help generate some jargon by writing a program that converts a long name like
# Portable Network Graphics to its acronym (PNG).
class Acronym
  def self.abbreviate(name)
    name.scan(/\b[a-zA-Z]/).join.upcase
  end
end

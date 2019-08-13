# It is found by comparing two DNA strands and counting how many of the
# nucleotides are different from their equivalent in the other string
class Hamming
  def self.compute(a_str, b_str)
    message = 'DNA strands must be of equal length.'
    raise ArgumentError, message unless a_str.length == b_str.length

    a_str.chars.zip(b_str.chars).reject { |a_val, b_val| a_val == b_val }.count
  end
end

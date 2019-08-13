# For Example

# input: [1,[2,3,null,4],[null],5]

# output: [1,2,3,4,5]
class FlattenArray
  def self.flatten(array)
    array.flatten.reject(&:nil?)
  end
end

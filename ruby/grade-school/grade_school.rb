# Given students' names along with the grade that they are in,
# create a roster for the school.
class School
  attr_reader :roster
  def initialize
    @roster = Hash.new []
  end

  def students(grade)
    roster[grade].sort
  end

  def students_by_grade
    hash = roster.map { |key, value| { grade: key, students: value.sort } }
    hash.sort_by { |hsh| hsh[:grade] }
  end

  def add(name, grade)
    roster[grade] += [name]
  end
end


class Person
  attr_accessor :age, :level

  RANK = ["Snr", "Mid", "Jr"]

  def initialize(age, level)
    self.age = age
    self.level = level
  end

  def rank_level
    RANK.index(level)
  end

  def <=>(other_person)
    RANK.index(level) <=> RANK.index(other_person.level)
  end
end

a = [
  Person.new(:young, "Jr"),
  Person.new(:young, "Mid"),
  Person.new(:old, "Snr"),
  Person.new(:old, "Jr"),
  Person.new(:old, "Mid")
]

# sort based on RANK
p a.sort

# sort by age first
p a.group_by(&:age).sort.flat_map { |group| group.last.sort }

# test
  RANK = ["Snr", "Mid", "Jr"]
  p a.sort { |x, y| [x.age, x.rank_level] <=> [y.age, y.rank_level]}


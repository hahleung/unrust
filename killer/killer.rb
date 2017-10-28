PEOPLE = %w(Larene James Juju Jola Dave Diego Cris Flo Stephen Charline Neil Mark Kein)

TASKS = [
  "Bring the person on the 1st floor",
  "Tell a joke and make the person laught",
  "Dance with the person",
  "Make the person imitate an animal",
  "Put something in the person's pocket - sneaky way",
  "Make the person hold a glass",
  "Make the person sing",
  "Make the person say 'pika, pika, pikachu'",
  "Make the person show her/his ID card or driving license",
  "Take a selfie with the person",
  "Help the person to achieve his/her mission",
  "Play rock/paper/scissors",
  "Make the people finish one of your sentence"
]

PEOPLE.repeated_combination(2).to_a.select { |x, y| x != y }

def make_pairs
  cloned_people = PEOPLE.clone.shuffle
  pairs = PEOPLE.map do |people|
    [people, cloned_people.pop]
  end

  invalid_pairs = pairs.map { |x, y| x == y }.include?(true)
  sorted_pairs = pairs.map(&:sort)
  twin_pairs = sorted_pairs.map { |x| sorted_pairs.count(x) }.uniq.length > 1

  if twin_pairs || invalid_pairs
    make_pairs
  else
    return pairs
  end
end

def assign_tasks
  make_pairs.zip(TASKS.shuffle).map do |(x, y), z|
    x + " to " + y + ": " + (z || "")
  end
end

puts assign_tasks

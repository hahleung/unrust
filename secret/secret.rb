require 'pry'

def recover_secret(triplets)
  (triplets *  10).shuffle.reduce({}) do |result, triplet|
    triplet
      .zip(triplet.drop(1))
      .reduce(result) do |transient, (t1, t2)|
        if !transient.has_key?(t1) && !transient.has_key?(t2)
          transient.merge(t1 => (transient.values.max || 0) + 1)
        elsif transient.has_key?(t1) && !transient.has_key?(t2)
          transient
        else
          check(transient, t1, t2)
        end
    end
  end.sort_by { |_key, value| value }.map(&:first).join
end

def check(result, t1, t2)
  t2_position = result[t2]

  if !result.has_key?(t1)
    insert(result, t1, t2_position)
  elsif result[t1] < t2_position
    result
  else
    insert(result, t1, t2_position)
  end
end

def insert(result, t1, t2_position)
  result
    .reduce({}) { |a, i| i.last >= t2_position ? a.merge(i.first => i.last + 1) : a.merge(i.first => i.last) }
    .merge(t1 => t2_position)
end

# Brute force beneath is not working for 474 triplets where the word is a 26 letters one
# Number of possibilities: 403291461126605635584000000 to be checked 474 times
# On my local it's 11s for 100k checks, meaning it would take 1406711717526846 years to solve
# (like mentioned, it's a brute force algo...)

# def recover_secret(triplets)
#   triplets
#     .flatten
#     .uniq
#     .permutation
#     .detect { |guess| triplets.all? { |t| check(guess, t) } }
#     .join
# end

# def check(word, triplet)
#   triplet
#     .map { |t| word.find_index t }
#     .each_cons(2)
#     .all? { |a, b| (a <=> b) <= 0 }
# end

# Useless dictionnary
# dictionnary = triplets.reduce({}) { |dict, t|
#   t1, t2, t3 = t
#   t1_upper = (dict.dig(t1, :upper) || [t2, t3]) | [t2, t3]
#   t2_lower = (dict.dig(t2, :lower) || [t1]) | [t1]
#   t2_upper = (dict.dig(t2, :upper) || [t3]) | [t3]
#   t3_lower = (dict.dig(t3, :lower) || [t1, t2]) | [t1, t2]

#   dict
#     .merge(t1 => {:upper => t1_upper})
#     .merge(t2 => {:lower => t2_lower, :upper => t2_upper})
#     .merge(t3 => {:lower => t3_lower})
# }

# Not mine, I like it, it's semi-brute force:
# def recover_secret triplets
#   letters = triplets.flatten.uniq.join
#   3.times do
#     triplets.each do |tri|
#       x,y,z = tri[0],tri[1],tri[2]

#       x_i, y_i = letters.index(x), letters.index(y)
#       if x_i > y_i
#         letters[x_i] = y
#         letters[y_i] = x
#       end

#       y_i, z_i = letters.index(y), letters.index(z)
#       if y_i > z_i
#         letters[y_i] = z
#         letters[z_i] = y
#       end
#     end
#   end
#   letters
# end

# Tried to improve it
def recover_secret2 triplets
  letters = triplets.flatten.uniq.join
  new_letters = ""

  while new_letters != letters do
    new_letters = letters.clone
    triplets.each do |tri|
      x, y, z = tri

      x_i, y_i = new_letters.index(x), new_letters.index(y)
      if x_i > y_i
        new_letters[x_i] = y
        new_letters[y_i] = x
      end

      y_i, z_i = new_letters.index(y), new_letters.index(z)
      if y_i > z_i
        new_letters[y_i] = z
        new_letters[z_i] = y
      end
    end
  end

  new_letters
end

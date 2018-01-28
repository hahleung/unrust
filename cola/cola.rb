def whoIsNext(names, p)
  position = p - 1
  names_size = names.length
  return names[position] if p <= names.length

  slice, lower_range = [0, 0]
  range = names_size * 2**slice

  while position >= range
    lower_slice, lower_range = [slice, range]

    slice += 1
    range += names_size * 2**slice
  end

  index = (position - lower_range) / 2**slice
  names[index]
end

# Other solution...
# def whoIsNext(names, r)
#   r -= 1
#   while r >= names.size
#     r -= names.size
#     r /= 2
#   end
#   names[r]
# end

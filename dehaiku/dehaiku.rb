def top_3_words(text)
  text
    .tr("/,.", "")
    .split(" ")
    .reject { |word| word == "'" }
    .inject(Hash.new(0)) { |counter, word| counter[word.downcase] += 1; counter }
    .sort_by { |_, value| value }
    .reverse
    .take(3)
    .map { |counter| counter.first }
end

# A better one:
# def top_3_words(text)
#   text.scan(/[A-Za-z']+/)
#       .select { |x| /[A-Za-z]+/ =~ x }
#       .group_by { |x| x.downcase }
#       .sort_by { |k,v| -v.count }
#       .first(3)
#       .map(&:first)
# end

# Oh my gosh...
# def top_3_words(t)
#   t.downcase.scan(/\w+[\w']*/).inject(Hash.new(0)){|h,w|h[w]+=1;h}.sort_by{|k,v|-v}.take(3).map(&:first)
# end

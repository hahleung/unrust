# You are given a string. Your job is to convert that string to upper case , then find the sum o each character converted to its ASCII value , then divide the sum by the string's length and round it down then convert that to its equivalent character in ASCII.
#     Twist : Do it in less than 55 chars for python and less than 60 chars for ruby. Both are exclusive.
#     Examples :

#     test.assert_equals(solution('abc') , 'B')
#     test.assert_equals(solution('asd') , 'H')
#     test.assert_equals(solution('iamareallyreallylongstringthatiscompletelyworthlessandisheretostophardcoders') , 'L')

# def solution(string)
#   (string.chars.reduce(0) { |sum, char| sum + char.ord } / string.length).chr
# end

# def solution(s);(s.chars.inject(0){|a,c|a+c.ord}/s.size).chr;end

# def solution(s);i=0;s.chars.each{|x|i+=x.ord};(i/s.size).chr;end

# def solution(s);(s.chars.map(&:ord).inject(:+)/s.size).chr.upcase;end

def solution(s);(s.upcase.bytes.sum/s.size).chr;end

p solution("iamareallyreallylongstringthatiscompletelyworthlessandisheretostophardcoders")
p solution("abc")

# Note: pretty useless Kata, as it forces you to find magic tricks available only for a language, no transferable knowledge here.

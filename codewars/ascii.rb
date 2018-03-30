def solution(string)
  (string.chars.reduce(0) { |sum, char| sum + char.ord } / string.length).chr
end

p solution("iamareallyreallylongstringthatiscompletelyworthlessandisheretostophardcoders")
p solution("abc")

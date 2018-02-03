def proper_fractions(integer)
  return 0 if integer == 1

  (1..integer).count { |numerator| Rational(numerator, integer).denominator == integer }
end

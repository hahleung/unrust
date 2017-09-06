def fib(n)
  [0, 1].include?(n) ? n : fib(n - 1) + fib(n - 2)
end

puts fib(10) == 55

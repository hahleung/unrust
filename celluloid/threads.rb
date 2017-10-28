puts "Hello"

@toto = 0
@tata = 1

t1 = Thread.new {
  puts "0 from t1"
  @toto = 10
  sleep 10
  puts "Who's that?"
}

t2 = Thread.new {
  puts "0 from t2"
  sleep 5
  @tata = 5
  puts "5"
  sleep 4
  puts "9"
}

threads = []
threads << t1
threads << t2

threads.each { |thr| thr.join }

p @toto + @tata

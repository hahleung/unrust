#ruby -Ilib:test car_test_with_stub.rb
#ruby -Ilib:test car_test.rb
#ruby -Ilib:test wheel_test.rb
ruby -Ilib -e 'ARGV.each { |f| require f }' ./*_test.rb

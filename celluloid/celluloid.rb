require 'celluloid'
require 'pry'

class Counter
  include Celluloid

  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def go
    2.downto(0).map do |i|
      sleep 1
      i.to_s + " " + text
    end
  end

  def result(go_future)
    p go_future.call
  end
end

texts = ["mississipi", "texas", "missouri"]

#texts.each do |text|
#  c = Counter.new(text)
#  go_future = c.future.go
#  c.result(go_future)
#end

actors = texts.map { |t| Counter.new(t) }
values = actors.map(&:future).map(&:go).map(&:value)
actors.map(&:terminate)
p values


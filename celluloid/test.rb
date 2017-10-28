require 'celluloid/current'

class Worker
  include Celluloid

  def add_one(number)
    number + 1
  end
end

def pool_test
  my_pool = Worker.pool(size: 10)

  test = (1..10000).map do |x|
    my_pool.add_one(x)
  end

  p test
end

class DummyWorker
  def add_one(number)
    number + 1
  end
end

def dummy_count
  test = (1..10000).map do |x|
    DummyWorker.new().add_one(x)
  end

  p test
end

pool_test

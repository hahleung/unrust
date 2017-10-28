require_relative "wheel.rb"

class Car
  def initialize(type)
    @wheels = Wheel.get_from(type)
  end

  def start_engine
    "vroom with " + @wheels.to_s
  end
end

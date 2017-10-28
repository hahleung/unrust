require_relative 'car.rb'

require 'minitest/spec'
require 'minitest/autorun'

describe "Start engine" do
  subject { engine.start_engine }
  let(:engine) { Car.new(type) }

  describe "Moto" do
    let(:type) { "moto" }

    it "makes 2 vrooms" do
      expected_engine = "vroom with 2"
      subject.must_equal(expected_engine)
    end
  end

  describe "Car" do
    let(:type) { "car" }

    it "makes 4 vrooms" do
      expected_engine = "vroom with 4"
      subject.must_equal(expected_engine)
    end
  end
end

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'

require_relative 'car'

describe Car, :start_engine do
  subject { Car.new(type).start_engine }

  let(:mock_wheel)  { Minitest::Mock.new }
  let(:type) { String }
  let(:noise) { "whatever" }

  it "should invoke get_from on Wheel" do
    mock_wheel.expect(:call, noise, [type])

    Wheel.stub(:get_from, mock_wheel) do
      subject.must_equal("vroom with " + noise)
    end

    mock_wheel.verify
  end
end

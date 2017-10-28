require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/mock'

require_relative 'car.rb'

class CarTest < MiniTest::Unit::TestCase
  def test_start_engine_mock_case
    mock_wheel = Minitest::Mock.new
    mock_response = "3"
    mock_argument = ["whatever"]

    mock_wheel.expect(:call, mock_response, mock_argument)

    Wheel.stub(:get_from, mock_wheel) do
      expected_start_engine_noise = "vroom with " + mock_response

      assert_equal(
        expected_start_engine_noise,
        Car.new(mock_argument.first).start_engine
      )
    end

    mock_wheel.verify
  end
end

#require 'minitest/mock'
#require 'minitest/unit'
#require 'date'
#
#MiniTest::Unit.autorun
#
#class TestMailPurge < MiniTest::Unit::TestCase
#  class MailPurge
#    def initialize(imap)
#      @imap = imap
#    end
#
#    def purge(date)
#      formatted_date = date.strftime('%d-%b-%Y')
#
#      @imap.authenticate('LOGIN', 'user', 'password')
#      @imap.select('INBOX')
#
#      message_ids = @imap.search(["BEFORE #{formatted_date}"])
#      @imap.store(message_ids, "+FLAGS", [:Deleted])
#    end
#  end
#
#  def test_purging_mail
#    date = Date.new(2010,1,1)
#    formatted_date = '01-Jan-2010'
#    ids = [4,5,6]
#
#    mock = MiniTest::Mock.new
#
#    # mock expects:
#    #            method      return  arguments
#    #-------------------------------------------------------------
#    mock.expect(:authenticate,  nil, ['LOGIN', 'user', 'password'])
#    mock.expect(:select,        nil, ['INBOX'])
#    mock.expect(:search,        ids, [["BEFORE #{formatted_date}"]])
#    mock.expect(:store,         nil, [ids, "+FLAGS", [:Deleted]])
#
#    mp = MailPurge.new(mock)
#    mp.purge(date)
#
#    assert mock.verify
#  end
#end
#
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#
#class Alpha
#  def process
#    Foo.bar
#    return nil
#  end
#end
#
#describe 'Alpha.process' do
#  it "calls Foo::bar" do
#    mock = MiniTest::Mock.new
#    mock.expect(:call, nil)
#    Foo.stub(:bar, mock) do
#      Alpha.new.process
#    end
#    mock.verify
#  end
#end

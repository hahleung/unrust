require 'minitest/autorun'
require_relative 'car.rb'

class CarTest < MiniTest::Unit::TestCase
  def test_start_engine_mock_case
    wheel_stubbed_value = rand(1..10)

    Wheel.stub(:get_from, wheel_stubbed_value) do
      expected_engine = "vroom with " + wheel_stubbed_value.to_s
      actual_engine = Car.new("whatever").start_engine

      assert_equal(expected_engine, actual_engine)
    end
  end
end

#class Post
#  attr_reader :published
#
#  def publish!
#    @published = true
#  end
#end
#
#class Blog
#  attr_reader :published_posts
#
#  def initialize author
#    @author = author
#    @published_posts = []
#  end
#
#  def publish! post
#    published_posts << post
#    post.publish!
#  end
#end

#require 'minitest/autorun'
#
#class BlogTest < Minitest::Test
#  def test_publish
#    post = Post.new
#    user = User.new
#    blog = Blog.new(user)
#    user.stub :author?, true do
#      blog.publish!(post)
#      assert_includes blog.published_posts, post
#    end
#  end
#end

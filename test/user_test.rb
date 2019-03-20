require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class TestUser < MiniTest::Test
  def test_does_it_exist
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_can_you_access_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_can_you_access_jokes_with_empty_array
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_can_a_user_learn_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal 2, sal.jokes.length
    assert_equal [joke_1, joke_2], sal.jokes
  end
end

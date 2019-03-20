require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class TestJoke < MiniTest::Test

  def test_does_it_exist
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_instance_of Joke, joke
  end

  def test_can_you_access_joke_id
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_equal 1, joke.id
  end

  def test_can_you_access_joke_setup
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_equal "Why did the strawberry cross the road?", joke.setup
  end

  def test_can_you_access_joke_punchline
    joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")

    assert_equal "Because his mother was in a jam.", joke.punchline
  end
end
__END__

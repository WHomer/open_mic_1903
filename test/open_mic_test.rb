require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'

class TestOpenMic < MiniTest::Test
  def test_does_it_exist
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_instance_of OpenMic, open_mic
  end

  def test_can_you_access_location
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "Comedy Works", open_mic.location
  end

  def test_can_you_access_date
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal "11-20-18", open_mic.date
  end

  def test_can_you_access_performers_expecting_empty_array
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})

    assert_equal [], open_mic.performers
  end

  def test_welcome_method_adds_user_to_performers_array
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)

    assert_equal 2, open_mic.performers.length
    assert_equal [sal, ali], open_mic.performers
  end

  def test_if_a_joke_has_been_repeated
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali.learn(joke_1)
    ali.learn(joke_2)

    assert_equal false, open_mic.repeated_jokes?

    ali.tell(sal, joke_1)
    assert open_mic.repeated_jokes?
  end
end

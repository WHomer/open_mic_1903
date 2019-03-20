require './lib/joke'
require 'pry'

class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.learn(joke)
  end

  def jokes_by_id(id)
    @jokes.select{|joke| joke.id == id}
  end
end

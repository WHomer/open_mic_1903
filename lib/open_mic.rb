require './lib/joke'
require './lib/user'

class OpenMic
attr_reader :location,
            :date,
            :performers

  def initialize(event)
    @location = event[:location]
    @date = event[:date]
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    jokes = @performers.map{|performer| performer.jokes}.flatten!
    jokes.uniq.length != jokes.length
  end
end

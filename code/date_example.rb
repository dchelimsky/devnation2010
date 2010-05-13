require 'active_support'
require 'active_support/core_ext'

class Movie
  def initialize(args)
  end
  
  def running?
    false
  end
end

describe Movie do
  it "is not running before the opening date" do
    today = Date.today
    tomorrow = today + 1.day
    Date.stub(:today) { today }
    movie = Movie.new(:opening_date => tomorrow)
    movie.should_not be_running
  end
end
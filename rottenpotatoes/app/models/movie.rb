class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def find_movies_with_same_director
      return nil if director == ""
      Movie.where ("director = '#{director}'")
  end

end

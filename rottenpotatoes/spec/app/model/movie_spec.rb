require 'rails_helper'

describe Movie do
  it "all_ratings" do
  expect(Movie.all_ratings).to eq %w(G PG PG-13 NC-17 R)
  end

  it "find_movie_with_same_director happy case" do
    movie = Movie.new :director=>"happy"
    moviedouble1 = double :director => "happy"
    moviedouble2 = double :director => "happy"
    list = [moviedouble1, moviedouble2]
    allow(Movie).to receive(:where).and_return(list)
    expect(movie.find_movies_with_same_director).to eq list
  end

  it "find_movie_with_same_director where director is empty string" do
    movie = Movie.new :director=>""
    expect(movie.find_movies_with_same_director).to eq nil
  end


end
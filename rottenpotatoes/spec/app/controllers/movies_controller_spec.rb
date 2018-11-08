# require 'movie'
require 'rails_helper'

describe MoviesController, :type => :controller do
  it "test s" do
    expect true ==true
  end

  describe "GET similar_movies" do

    it "director value is not empty" do
      fake_movie = object_double(Movie.new, :director => "hello", :title => "fakemovie")
      fake_movie2 = object_double(Movie.new, :director => "hello")
      fake_movie3 = object_double(Movie.new, :director => "hello")
      allow(Movie).to receive(:find){1}.and_return(fake_movie)
      allow(Movie).to receive(:where).and_return([fake_movie2,fake_movie3])
      expect(get :similar_movies, :movie_id => 1).to render_template "movies/similar_movies"

    end

    it "director value is empty string" do
      fake_movie_without_director = double(:director => "", :title =>"faketitle")
      allow(Movie).to receive(:find){2}.and_return(fake_movie_without_director)
      expect(get :similar_movies, :movie_id => 2).to redirect_to "/movies"
      expect(flash[:message]).to eq "'faketitle' has no director info"
    end

    it "movie id does not exist" do
      allow(Movie).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      begin
      get :similar_movies, :movie_id => 3
        fail "if we get to herewithout rescuing, we fail this test. the get method should throw an activerecord exception"
      rescue ActiveRecord::RecordNotFound
        end
    end
    end
end


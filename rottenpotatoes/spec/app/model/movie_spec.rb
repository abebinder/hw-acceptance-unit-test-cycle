require 'rails_helper'

describe Movie do
  it "all_ratings" do
  expect(Movie.all_ratings).to eq %w(G PG PG-13 NC-17 R)
  end
end
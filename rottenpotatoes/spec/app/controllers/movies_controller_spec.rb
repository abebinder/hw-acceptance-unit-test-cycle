# require 'movie'
require 'rails_helper'

describe MoviesController, :type => :controller do
  it "test s" do
    expect true ==true
  end

  describe "GET index" do
    it "populates an array of contacts" do
      get :index
      expect(response)
    end
    end
end


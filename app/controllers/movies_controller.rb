class MoviesController < ApplicationController
  def index
    @movies = Movie.order(rating: :desc)
  end
end

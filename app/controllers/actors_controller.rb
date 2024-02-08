class ActorsController < ApplicationController
  def index
    @actors = if params[:search]
      Actor.where("name LIKE ?", "%#{params[:search]}%")
    else
      Actor.all
    end
  end
end

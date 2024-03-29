class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie


  validates :stars, presence: true
  validates :user, presence: true
  validates :movie, presence: true
  validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_create :update_movie_average_rating

  def update_movie_average_rating
    movie.update_average_rating
  end
end

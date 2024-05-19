class Movie < ApplicationRecord
    has_many :actings
    has_many :actors, through: :actings
    has_many :filming_location
    has_many :locations, through: :filming_location
    has_many :reviews


    belongs_to :director

    validates :name, uniqueness: true
    validates :name, presence: true
    def update_average_rating
        ratings = self.reviews
        average = ratings.pluck(:stars).sum.to_f / ratings.size
        self.update(rating: average)
    end

    def self.sorted_by_average_star_rating
        joins(:reviews)
            .select('movies.*, AVG(reviews.stars) AS average_star_rating')
            .group('movies.id')
            .order('average_star_rating DESC')
    end
end

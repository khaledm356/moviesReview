class FilmingLocation < ApplicationRecord
  belongs_to :location
  belongs_to :movie
end

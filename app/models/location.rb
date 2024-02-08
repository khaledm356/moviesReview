class Location < ApplicationRecord
    has_many :filming_location
    has_many :movies, through: :filming_location
end

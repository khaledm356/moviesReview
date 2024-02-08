class Director < ApplicationRecord
    has_many :movies
    validates :name, uniqueness: true
end

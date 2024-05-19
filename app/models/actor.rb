class Actor < ApplicationRecord
    has_many :actings
    has_many :movies, through: :actings
    validates :name, presence: true
    validates :name, uniqueness: true
end

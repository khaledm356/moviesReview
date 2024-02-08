class User < ApplicationRecord
    has_many :reviews
    validates :name, uniqueness: true
    validates :name, presence: true
end

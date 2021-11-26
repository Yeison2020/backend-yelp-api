class User < ApplicationRecord
    has_many :reviews 
    has_many :businesses, through: :reviews


    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end

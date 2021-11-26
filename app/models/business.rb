class Business < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true
    validates :category, :city, :state, :zip_code, presence: true
end

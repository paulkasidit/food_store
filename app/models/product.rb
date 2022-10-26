class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy 
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
end
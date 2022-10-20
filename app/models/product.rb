class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy 
end
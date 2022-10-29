class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :content_body, length: { minimum: 50 }
  validates :content_body, length: { maximum: 250 } 
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
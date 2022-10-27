class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true

  validates :content_body, presence: true
  validates :content_body, length: { minimum: 50 }
  validates :content_body, length: { maximum: 250 } 

  validates :rating, presence: true 
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5],
    message: "%{value} is not a valid rating, please enter a rating from 1 to 5." }

end
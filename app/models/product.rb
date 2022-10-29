class Product < ApplicationRecord

  before_save(:titleize_name, :titleize_country_of_origin)

  has_many :reviews, dependent: :destroy 
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
    )}
  
  scope :three_most_recent_products, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, products.created_at")
    .order("products.created_at DESC")
    .limit(3)
  )}

  scope :products_made_in_the_USA, -> {where("country_of_origin = 'Usa'")}

  private

    def titleize_name
      self.name = self.name.titleize
    end

    def titleize_country_of_origin
      self.country_of_origin = self.country_of_origin.titleize
    end

end
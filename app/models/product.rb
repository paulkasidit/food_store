class Product < ApplicationRecord

  before_save(:titleize_name, :titleize_country_of_origin)

  has_many :reviews, dependent: :destroy 
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  private

    def titleize_name
      self.name = self.name.titleize
    end

    def titleize_country_of_origin
      self.country_of_origin = self.country_of_origin.titleize
    end

end
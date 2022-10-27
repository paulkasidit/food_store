require 'rails_helper'

describe Product do
  # Tests will go here.
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it("titleizes the name of the product") do
    product = Product.create({name: "french brie", cost: 5.99, country_of_origin: "france"})
    expect(product.name()).to(eq("French Brie"))
  end

  it("titleizes the name of country of origin") do
    product = Product.create({name: "french brie", cost: 5.99, country_of_origin: "france"})
    expect(product.country_of_origin()).to(eq("France"))
  end

end

require 'rails_helper'

describe "process of deleting a product" do
  it "deletes a new product" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Delete Product'
    expect(page).to have_content 'Product and all associated reviews have been deleted.'
  end
end
require 'rails_helper'

describe "process of updating a product" do
  it "adds a new product" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Edit Product'
    fill_in 'Country of origin', :with => 'UK'
    click_on 'Update Product'
    expect(page).to have_content 'Product has been successfuly updated!'
    product.destroy
  end

  it "gives an error when an empty form is submitted" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Edit Product'
    fill_in 'Name', :with => ' '
    fill_in 'Cost', :with => ' '
    fill_in 'Country of origin', :with => ' '
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
    product.destroy
  end
end
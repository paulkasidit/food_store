require 'rails_helper'

describe "process of adding a product" do
  it "adds a new product" do
    visit products_path
    click_on 'Create new product'
    fill_in 'Name', :with => 'Folgers Instant Roast Coffee'
    fill_in 'Cost', :with => '10'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Folgers Instant Roast Coffee'
  end

  it "gives an error when an empty add new product form is submitted" do
    visit new_product_path
    click_button 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end
end
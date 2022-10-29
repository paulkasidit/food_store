describe "updating a review" do
  it "deletes a review" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    review = Review.create({:author => 'Paul', :content_body => 'Good stuff, I love the fragrant smell. It is out of this world.', :rating => 5 , :product_id => product.id})
    visit("/products/#{product.id}/reviews/#{review.id}")
    click_on 'Edit Review'
    fill_in 'Author', :with => 'Sally'
    click_on 'Update Review'
    expect(page).to have_content 'Sally'
  end
end

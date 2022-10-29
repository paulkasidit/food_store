describe "adding a review" do
  it "adds a new review" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Write a New Review'
    fill_in 'Author', :with => 'Paul'
    fill_in 'review_content_body', :with => 'This excellent product is extremely satisfying to the palate. Good for my discerning tastes.'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Review has been added!'
  end

  it "gives an error when an empty add new review form is submitted" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Write a New Review'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Rating is not a number"
    expect(page).to have_content "Rating is not a number"
  end

  it "gives an error when a rating is not within valid range [1..5]" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Write a New Review'
    fill_in 'Author', :with => 'Paul'
    fill_in 'review_content_body', :with => 'This excellent product is extremely satisfying to the palate. Good for my discerning tastes.'
    fill_in 'Rating', :with => '8'
    click_on 'Create Review'
    expect(page).to have_content "Rating must be less than or equal to 5"
  end

  it "gives an error when content body is too short" do
    product = Product.create({:name => 'Folgers Instant Roast Coffee', :cost => 15, :country_of_origin => 'USA'})
    visit("/products/#{product.id}")
    click_on 'Write a New Review'
    fill_in 'Author', :with => 'Paul'
    fill_in 'review_content_body', :with => 'Good for my discerning tastes.'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end
end

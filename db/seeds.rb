require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first

product_reviews = ['Good stuff, I love the fragrant smell. It is out of this world.',
  'Ok quality, I hate the fragrant smell. It is not out of this world. Look elsewhere',
  'Satisfactory product, I can stand the rancid smell. It is better to look at other products. Look elsewhere',
  'This excellent product is extremely satisfying to the palate. Good for my discerning tastes.']
product_country_of_origin = ['USA','Ethiopia','Venezuela','Indonesia','Ghana','Kenya','Columbia','Brazil']
product_ratings = [1,2,3,4,5]
product_prices = [19.99, 15.99, 17.95, 83.88, 7.95, 5.50, 10.25, 17.89]

Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Coffee.blend_name,
                  cost: (product_prices).sample,
                  country_of_origin: (product_country_of_origin).sample)
  end

p "Created #{Product.count} products"

Review.destroy_all 

250.times do |index| 
  Review.create!(author: Faker::FunnyName.name, 
                content_body: (product_reviews).sample, 
                rating: (product_ratings).sample,
                product_id: (Product.ids).sample)
  end

p "Created #{Review.count} reviews"

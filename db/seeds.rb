# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Creating 3 products for the Cart
require 'faker'

puts 'Starting product creation process...'

3.times do |_i|
  product = Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 5.0..100.0),
    quantity: rand(1..10)
  )

  puts "Product created: #{product.inspect}"

  rand_i = rand(1..3)
  file_path = Rails.root.join("app/assets/images/product-#{rand_i}.png")

  file = File.open(file_path)
  product.image.attach(io: file, filename: "product-#{rand_i}.png", content_type: 'image/png')

  puts "Image 'product-#{rand_i}.png' attached to product ID: #{product.id}"
end

puts 'Product creation process completed.'

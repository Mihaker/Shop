
15.times do
  category_id = rand(1...5)
  category = Category.find_by(id: category_id)
  
  Product.create(
    name: Faker::Book.unique.title,
    price: Faker::Commerce.price(range: 10..100.0, as_string: true),
    image_url: Faker::Internet.url,
    description: Faker::Lorem.paragraph,
    category: category
  )
end
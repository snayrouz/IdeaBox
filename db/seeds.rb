Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

8.times do
  Category.create(name: Faker::Beer.style)
end
puts "Seeded categories"

20.times do
  user = User.create!(username: Faker::Internet.user_name,
                password: Faker::Internet.password,
                email: Faker::Internet.email,
                role: Faker::Number.between(0, 1))
  20.times do
    user.ideas.create!(title: Faker::Dessert.topping,
                       description: Faker::ChuckNorris.fact,
                       category_id: Faker::Number.between(1, 8),
                       user_id: Faker::Number.between(1, 20))
  end
end
puts "Seeded users and ideas"

10.times do
  counter = rand(100)
  Image.create!(title: "Image #{counter}", url: Faker::Avatar.unique.image)
end

puts "Seeded images"

User.create(username: "user", password: "123", email: 'user@example.com')
User.create(username: "admin", password: "123", email: 'admin@example.com', role: 1)

puts "Successfully seeded IdeaBox database."

Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

10.times do
  Category.create(name: Faker::Job.key_skill)
end
puts "Seeded categories"

20.times do
  user = User.create!(username: Faker::Internet.user_name,
                password: Faker::Internet.password,
                email: Faker::Internet.email,
                role: Faker::Number.between(0, 1))
  20.times do
    user.ideas.create!(title: Faker::RickAndMorty.quote,
                       description: Faker::FamilyGuy.quote,
                       category_id: Faker::Number.between(1, 10),
                       user_id: Faker::Number.between(1, 20))
  end
end
puts "Seeded users and ideas"

20.times do
  counter = rand(20)
  Image.create!(title: "Robot #{counter}", url: Faker::Fillmurray.image)
end

puts "Seeded images"

User.create(username: "user", password: "123", email: 'user@example.com')
User.create(username: "admin", password: "123", email: 'admin@example.com', role: 1)

puts "You did it. You finally seeded this database. Go ahead and crack open a cold beer!"

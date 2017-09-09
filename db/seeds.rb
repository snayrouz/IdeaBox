Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

USERS = ["Sam", "Darby", "Moose", "Peter", "Jerry"]
IDEAS = ["Concert", "Curriculum", "Vacation", "Holidays", "Dog"]
IMAGES = ["https://robohash.org/1","https://robohash.org/2","https://robohash.org/3","https://robohash.org/4","https://robohash.org/5"]
CATEGORIES = ["Travel", "Pets", "Personal", "Turing", "Music", "Fun"]
DESCRIPTION = ["Fleet Foxes at Red Rocks", "Mod 2 CRUDing many to many", "Europe for post school vacation", "go to Cali for Xmas", "Get moose leash trained"]
EMAIL = ["sam@example.com", "darby@example.com", "moose@example.com", "peter@example.com", "jerry@example.com"]

USERS.each do |name|
  user = User.create!(username: name, password: IDEAS.sample, email: EMAIL.sample)
  puts "Created #{user.username}"
  5.times do |num|
    user.ideas.create!(title: IDEAS.sample, description: DESCRIPTION.sample, category: Category.find_or_create_by(name: CATEGORIES.sample))
  end
end

IMAGES.each do |image|
  counter = rand(100)
  Image.create!(title: "Robot #{counter}", url: image)
end

User.create(username: "user", password: "123", email: 'user@example.com')
User.create(username: "admin", password: "123", email: 'admin@example.com', role: 1)

puts "Seeded like a boss"

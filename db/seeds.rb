# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
puts "Start"

user = User.create(
	email: 'bdlb@utexas.edu',
	password: 123456
)
user.save!
puts "user created"

contact = Contact.create(
	first_name: Faker::DragonBall.character, #=> "Goku"
	user_id: user.id,
  email: Faker::Internet.email
)
contact.save!

puts "contacts created"
10.times do
  location = Location.create(
    title: Faker::DragonBall.character,
    user_id: user.id
    )
  location.save!
end

puts "location created"
10.times do
  milestone = Milestone.create(
    contact_type: Faker::Address.full_address,
    # notes: Faker::Friends.quote,
    contact_id: Faker::Number.between(1, 1),
    location_id: Faker::Number.between(1, 3)
  )
  milestone.save!
end
puts "milestone created!"

15.times do
  tag = Tag.create(
    title: Faker::Hobbit.character, #=> "Gandalf the Grey"
    user_id: user.id #=> "Tatooine"
  )
  tag.save!
end

puts "Tags created!"
10.times do
  subject = Subject.create(
    name: Faker::Friends.character, #=> "Rachel Green" #=> "Gungan"
    milestone_id: Faker::Number.between(1, 5),
    tag_id: Faker::Number.between(1, 5)
  )
  subject.save!
end

puts "finished!"


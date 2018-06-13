# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
puts "Start"

user = User.new(
	email: 'bdlb@utexas.edu',
	password: 123456
)
user.save!
puts "user created"

  contact = Contact.new(
  	first_name: Faker::DragonBall.character, #=> "Goku"
  	user_id: user.id,
    email: Faker::Internet.email
  )
contact.save!

puts "contacts created"

3.times do 
  location = Location.new(
    title: Faker::GameOfThrones.city,

    user_id: user.id
    )
location.save!
end

puts "location created"

3.times do 
  milestone = Milestone.new(
    contact_type: Faker::Address.full_address,

    contact_id: Faker::Number.between(1, 1),
    location_id: Faker::Number.between(1, 2)
  )
milestone.save!
end
puts "milestone created!"


3.times do 
  tag = Tag.new(
    title: Faker::Job.field, #=> "Gandalf the Grey"

    user_id: user.id #=> "Tatooine"
  )
  tag.save!
end

puts "Tags created!"
3.times do
  subject = Subject.new(
    milestone_id: Faker::Number.between(1, 3),
    tag_id: Faker::Number.between(1, 3)
  )
  subject.save!
end

puts "finished!"


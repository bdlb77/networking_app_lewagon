# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
puts "Start"
Milestone.destroy_all
Contact.destroy_all
User.destroy_all
puts "Data destoyed"
user = User.new(
	email: 'bdlb@utexas.edu',
	password: 123456
)
user.save!

 10.times do
	contact = Contact.new(
		first_name: Faker::Artist.name,
		user_id: user.id,
    email: Faker::Internet.email
	)
	contact.save!
end

  10.times do
  milestone = Milestone.new(
    contact_type: Faker::Address.full_address,
    notes: Faker::Friends.quote,
    contact_id: Contact.last.id
  )

  milestone.save!

end


puts "finished!"


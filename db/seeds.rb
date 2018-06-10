# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
Contact.destroy_all
Milestone.destroy_all
User.destroy_all

user = User.new(
	email: 'bdlb@utexas.edu',
	password: 123456
)
user.save! 
 
	contact = Contact.new(
		first_name: 'Bryan',
		user_id: user.id
	)
	contact.save!


puts "finished!"

  milestone = Milestone.new(
    id: 1,
    contact_type: Faker::Address.full_address,
    notes: Faker::Friends.quote,
    contact_id: contact.id
  )
  milestone.save!



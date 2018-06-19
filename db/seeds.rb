# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require 'faker'
# puts "Start"
    user = User.new(
    email: "amg@gmail.com",
    password: "123456",
    )
    user.save!


   #Tags:

    tag1 = Tag.new(
    user_id: 1,
    title: "finance",
  )
    tag1.save!

    tag2 = Tag.new(
    user_id: 1,
    title: "real estate",
  )
    tag2.save!

    tag3 = Tag.new(
    user_id: 1,
    title: "freelance jobs"
  )
    tag3.save!

    tag4 = Tag.new(
    user_id: 1,
    title: "fintech",
  )
    tag4.save!

    tag5 = Tag.new(
    user_id: 1,
    title: "high-tech",
  )
    tag5.save!

    tag6 = Tag.new(
    user_id: 1,
    title: "home design",
  )
    tag6.save!

    tag7 = Tag.new(
    user_id: 1,
    title: "social",
  )
    tag7.save!

    tag8 = Tag.new(
    user_id: 1,
    title: "HR",
  )
    tag8.save!

    tag9 = Tag.new(
    user_id: 1,
    title: "vecation",
  )
    tag9.save!

    tag10 = Tag.new(
    user_id: 1,
    title: "investments",
  )
    tag10.save!

    tag11 = Tag.new(
    user_id: 1,
    title: "entrepreneur",
  )
    tag11.save!

    tag12 = Tag.new(
    user_id: 1,
    title: "marketing",
  )
    tag12.save!

    tag13 = Tag.new(
    user_id: 1,
    title: "international",
  )
    tag13.save!

    tag14 = Tag.new(
    user_id: 1,
    title: "manufacturer",
  )
    tag14.save!

    tag15 = Tag.new(
    user_id: 1,
    title:"back-end",
  )
    tag15.save!

     tag16 = Tag.new(
    user_id: 1,
    title: "rich",
  )
    tag16.save!


    tag17 = Tag.new(
    user_id: 1,
    title: "volunteering",
  )
    tag17.save!

    tag18 = Tag.new(
    user_id: 1,
    title: "education",
  )
    tag18.save!

    tag19 = Tag.new(
    user_id: 1,
    title: "coworker",
  )
    tag19.save!

    tag20 = Tag.new(
    user_id: 1,
    title: "top-contacts"
  )
    tag20.save!

    tag21 = Tag.new(
    user_id: 1,
    title: "fashion"
  )
    tag21.save!

    tag22 = Tag.new(
    user_id: 1,
    title: "eCommerce"
  )
    tag22.save!

    tag23 = Tag.new(
    user_id: 1,
    title: "I helped"
  )
    tag23.save!

    tag23 = Tag.new(
    user_id: 1,
    title: "retail"
  )
    tag23.save!


#_________________________________________________________________________-

    #Location:


    location1 = Location.new(
    user_id: 1,
    title: "fintech conference",
  )
    location1.save!

    location2 = Location.new(
    user_id: 1,
    title: "bank",
  )
    location2.save!

    location3 = Location.new(
    user_id: 1,
    title: "real estate conferance",
  )
    location3.save!

    location4 = Location.new(
    user_id: 1,
    title: "new york business travel",
  )
    location4.save!


    location5 = Location.new(
    user_id: 1,
    title: "china business travel",
  )
    location5.save!

    location6 = Location.new(
    user_id: 1,
    title: "email-referral",
  )
    location6.save!

    location7 = Location.new(
    user_id: 1,
    title: "Alumni Event",
  )
    location7.save!

    location8 = Location.new(
    user_id: 1,
    title: "social event",
  )
    location8.save!

    location9 = Location.new(
    user_id: 1,
    title: " coincidental meeting",
  )
    location9.save!


    location10 = Location.new(
    user_id: 1,
    title: "work meeting",
  )
    location10.save!

    location11 = Location.new(
    user_id: 1,
    title: "basketball game",
  )
    location11.save!

    location12 = Location.new(
    user_id: 1,
    title: "social media",
  )
    location12.save!

    location13 = Location.new(
    user_id: 1,
    title: "school reunion",
  )
    location13.save!


    location14 = Location.new(
    user_id: 1,
    title: "vacation"
  )
    location14.save!

    location15 = Location.new(
    user_id: 1,
    title: "eCommerce conference"
  )
    location15.save!

    location16 = Location.new(
    user_id: 1,
    title: "virtual"
  )
    location16.save!

    location16 = Location.new(
    user_id: 1,
    title: "business meeting"
  )
    location16.save!

  #____________________________________________________________________

   #['Physical meeting' , 'Virtual (Email etc)', 'Phone call']

   #__________________________________________



    contact1 = Contact.new(
    user_id: 1,
    # contact_id: 1,
    first_name: "Whitney",
    last_name: "Wolfe",
    position: "CEO",
    company: "Bumble",
    username:"",
    email:"wwolfe@bumble.com",
    phone_number:"",
  )
    contact1.save!

    milestone1 = Milestone.new(
    contact_id: 1,
    contact_type: 'Physical meeting',
    location_id: 15,
    note: "looking for an amazing public relations master",
    assigment_one:"check with Ben if he knows someone relevant for the job",
    assigment_two:"send responding email as soon as posible",
  )
    milestone1.save!


    subject = Subject.new(
    tag_id: 5,
    milestone_id:1,
  )
    subject.save!

    subject = Subject.new(
    tag_id: 11,
    milestone_id: 1,
  )
    subject.save!


    milestone2 = Milestone.new(
    contact_id:1,
    contact_type:'Virtual (Email etc)',
    location_id: 16,
    note: "sent Whitney a public relations referral",
    assigment_one: "follow up in one month to check if the referral was beneficial",
    assigment_two:"",
  )
    milestone2.save!


    subject = Subject.new(
    tag_id: 8 ,
    milestone_id: 2,
  )
    subject.save!

    subject = Subject.new(
    tag_id:23 ,
    milestone_id: 2,
  )
    subject.save!

    milestone3 = Milestone.new(
    contact_id: 1,
    contact_type: 'Physical meeting',
    location_id: 16,
    note: "checked for a possible mutual invesment in a small appartment building in Berlin",
    assigment_one: "reaserch Berlin real estate market",
    assigment_two: "sceduale a futur meeting with Whitney",
  )
    milestone3.save!


    subject = Subject.new(
    tag_id: 10,
    milestone_id: 3,
  )
    subject.save!

    subject = Subject.new(
    tag_id: 2,
    milestone_id:3,
  )
    subject.save!


#_________________________________________________________________________


    contact2 = Contact.new(
    user_id: 1,
    # contact_id: 1,
    first_name: "Keith",
    last_name: "McCarty",
    position: "CEO",
    company: "Eaze",
    username:"",
    email:"keith@Eaze.com",
    phone_number:"",
  )
    contact2.save!

    milestone4 = Milestone.new(
    contact_id: 2,
    contact_type: 'Physical meeting',
    location_id: 7,
    note:"",
    assigment_one: "check new virtual coins",
    assigment_two:"",
  )
    milestone4.save!


    subject = Subject.new(
    tag_id: 13,
    milestone_id:4,
  )
    subject.save!


    subject = Subject.new(
    tag_id: 4,
    milestone_id:4,
  )
    subject.save!


    milestone5 = Milestone.new(
    contact_id: 2,
    contact_type:  'Physical meeting',
    location_id: 8,
    note: "connect Keith with Jhoe from new york hospital ",
    assigment_one: "send email to Jhon",
    assigment_two: "foolow up in 3 weeks",
  )
    milestone5.save!


    subject = Subject.new(
    tag_id: 23,
    milestone_id: 5,
  )
    subject.save!

  #   subject = Subject.new(
  #   tag_id: ,
  #   milestone_id:
  # )
  #   subject.save!

    milestone6 = Milestone.new(
    contact_id: 2,
    contact_type: 'Virtual (Email etc)',
    location_id: 16,
    note: "got a job offer to design Webical's home page layout",
    assigment_one: "get in touch with Webical and sceduale meeting",
    assigment_two:"",
  )
    milestone6.save!


    subject = Subject.new(
    tag_id: 3,
    milestone_id:6,
  )
    subject.save!


    subject = Subject.new(
    tag_id:5 ,
    milestone_id:6,
  )
    subject.save!

#_____________________________________________________________________________


#     contact3 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact3.save!


#     milestone7 = Milestone.new(
#     contact_id: 3,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone7.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone8 = Milestone.new(
#     contact_id: 3,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone8.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone9 = Milestone.new(
#     contact_id: 3,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone9.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


# #_________________________________________________________________________


#    contact4 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact4.save!

#     milestone10 = Milestone.new(
#     contact_id: 4,
#     contact_type: 'Physical meeting',
#     location_id: 15,
#     note: "looking for an amazing public relations master",
#     assigment_one:"check with Ben if he knows someone relevant for the job",
#     assigment_two:"send responding email as soon as posible",
#   )
#     milestone10.save!


#     subject = Subject.new(
#     tag_id: 5,
#     milestone_id:1,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: 11,
#     milestone_id: 1,
#   )
#     subject.save!


#     milestone11 = Milestone.new(
#     contact_id:4,
#     contact_type:'Virtual (Email etc)',
#     location_id: 16,
#     note: "sent Whitney a public relations referral",
#     assigment_one: "follow up in one month to check if the referral was beneficial",
#     assigment_two:"",
#   )
#     milestone11.save!


#     subject = Subject.new(
#     tag_id: 8 ,
#     milestone_id: 2,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id:23 ,
#     milestone_id: 2,
#   )
#     subject.save!

#     milestone12 = Milestone.new(
#     contact_id: 4,
#     contact_type: 'Physical meeting',
#     location_id: 16,
#     note: "checked for a possible mutual invesment in a small appartment building in Berlin",
#     assigment_one: "reaserch Berlin real estate market",
#     assigment_two: "sceduale a futur meeting with Whitney",
#   )
#     milestone12.save!


#     subject = Subject.new(
#     tag_id: 10,
#     milestone_id: 3,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: 2,
#     milestone_id:3,
#   )
#     subject.save!


# #_________________________________________________________________________


#     contact5 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact5.save!

#     milestone13 = Milestone.new(
#     contact_id: 5,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone13.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     milestone14 = Milestone.new(
#     contact_id: 5,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone14.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone15 = Milestone.new(
#     contact_id: 5,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone15.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

# #_____________________________________________________________________________


#     contact6 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact6.save!


#     milestone16 = Milestone.new(
#     contact_id: 6,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone16.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone17 = Milestone.new(
#     contact_id: 6,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone17.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone18 = Milestone.new(
#     contact_id: 6,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone18.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!



# #_____________________________________________________________________________


#     contact7 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact7.save!


#     milestone19 = Milestone.new(
#     contact_id: 7,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone19.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone20 = Milestone.new(
#     contact_id: 7,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone20.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone21 = Milestone.new(
#     contact_id: 7,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone21.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


# #_________________________________________________________________________


#    contact8 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact8.save!

#     milestone22 = Milestone.new(
#     contact_id: 8,
#     contact_type: 'Physical meeting',
#     location_id: 15,
#     note: "looking for an amazing public relations master",
#     assigment_one:"check with Ben if he knows someone relevant for the job",
#     assigment_two:"send responding email as soon as posible",
#   )
#     milestone22.save!


#     subject = Subject.new(
#     tag_id: 5,
#     milestone_id:1,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: 11,
#     milestone_id: 1,
#   )
#     subject.save!


#     milestone23 = Milestone.new(
#     contact_id:8,
#     contact_type:'Virtual (Email etc)',
#     location_id: 16,
#     note: "sent Whitney a public relations referral",
#     assigment_one: "follow up in one month to check if the referral was beneficial",
#     assigment_two:"",
#   )
#     milestone23.save!


#     subject = Subject.new(
#     tag_id: 8 ,
#     milestone_id: 2,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id:23 ,
#     milestone_id: 2,
#   )
#     subject.save!

#     milestone24 = Milestone.new(
#     contact_id: 8,
#     contact_type: 'Physical meeting',
#     location_id: 16,
#     note: "checked for a possible mutual invesment in a small appartment building in Berlin",
#     assigment_one: "reaserch Berlin real estate market",
#     assigment_two: "sceduale a futur meeting with Whitney",
#   )
#     milestone24.save!


#     subject = Subject.new(
#     tag_id: 10,
#     milestone_id: 3,
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: 2,
#     milestone_id:3,
#   )
#     subject.save!


# #_________________________________________________________________________


#     contact9 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact9.save!

#     milestone25 = Milestone.new(
#     contact_id: 9,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone25.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     milestone26 = Milestone.new(
#     contact_id: 9,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone26.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone27 = Milestone.new(
#     contact_id: 9,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone27.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

# #_____________________________________________________________________________


#     contact10 = Contact.new(
#     user_id: 1,
#     # contact_id: 1,
#     first_name: "Whitney",
#     last_name: "Wolfe",
#     position: "CEO",
#     company: "Bumble",
#     username:"",
#     email:"wwolfe@bumble.com",
#     phone_number:"",
#   )
#     contact10.save!


#     milestone28 = Milestone.new(
#     contact_id: 10,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone28.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone29 = Milestone.new(
#     contact_id: 10,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone29.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!

#     milestone30 = Milestone.new(
#     contact_id: 10,
#     contact_type:
#     location_id:
#     note:
#     assigment_one:
#     assigment_two:
#   )
#     milestone30.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!


#     subject = Subject.new(
#     tag_id: ,
#     milestone_id:
#   )
#     subject.save!



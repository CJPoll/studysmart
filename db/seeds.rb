# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cody = User.create!({
  email: 'CJPoll@gmail.com',
  password: 'password01',
  password_confirmation: 'password01',
  first_name: 'Cody',
  last_name: 'Poll'
})

jimmy = User.create!({
  email: 'jimmy@school.com',
  password: 'password01',
  password_confirmation: 'password01',
  first_name: 'Jimmy',
  last_name: 'Hoffa'
})

byu     = University.create({name: 'BYU'})
byui    = University.create({name: 'BYU-Idaho'})
harvard = University.create({name: 'Harvard'})
psu = University.create({name: 'Plymouth State University'})

cs        = Course.create({name: "Computer Science 101", university: byu})
marketing = Course.create({name: "Marketing 101", university: byui})
business  = Course.create({name: "Business 101", university: harvard})
business  = Course.create({name: "Writing & the Creative Process", university: psu})
business  = Course.create({name: "Business Operations", university: psu})
business  = Course.create({name: "Managerial Accounting", university: psu})
business  = Course.create({name: "College Algebra", university: psu})
business  = Course.create({name: "Early Childhood Development", university: psu})
business  = Course.create({name: "Introduction to Biology", university: psu})

cody.universities << byui
cody.tutors cs

jimmy.tutors marketing
jimmy.tutors business

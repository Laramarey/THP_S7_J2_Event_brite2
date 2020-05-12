
require 'faker'
#remplir mon tableau users
#
nb_user = 10
nb_events = 5
nb_guests = 10


nb_user.times do |x|
	  User.create(
  	  description: Faker::Quote.famous_last_words, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Name.first_name+'@yopmail.com',
    puts "Seeding de l'utilisateur numéro #{x}"
end

#remplir mon tableau events

      #for the random startdate
t1 = Time.parse("2020-01-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

nb_events.times do |x|
    Event.create(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    admin_id: User.all.sample.id)
  puts "Seeding de l'Event numéro #{x}"
end


#remplir mon tableau attendances
nb_guests.times do |x|
	Attendance.create(
		user_id: User.all.sample.id
		event_id: Event.all.sample.id)
	puts "Seeding du Participant (correspond à une Attendance, participation) numéro #{x}"
end


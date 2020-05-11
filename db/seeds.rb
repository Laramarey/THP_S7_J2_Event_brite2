
#remplir mon tableau users

20.times do |x|
   fname = Faker::Name.first_name
	  User.create(
	  description: Faker::Quote.famous_last_words, 
      first_name: fname,
      last_name: Faker::Name.last_name,
	   email: fname + "@yopmail.com")
      puts "Seeding de l'utilisateur numéro #{x}"
end

#remplir mon tableau events

      #for the random startdate
t1 = Time.parse("2021-11-01 14:40:34")
t2 = Time.parse("2022-01-01 00:00:00")

20.times do |x|
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
20.times do |x|
	Attendance.create(
		user_id: User.all.sample.id
		event_id: Event.all.sample.id)
	puts "Seeding du Participant (correspond à une Attendance, participation) numéro #{x}"
end


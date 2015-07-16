User.create(name: 'user', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar')

10.times do
	name = Faker::Name.name
	email = "#{name.split(' ').join('.')}@example.com"
	User.create(name: name, email: email, password: 'foobar', password_confirmation: 'foobar')
end

5.times do
	event_name = Faker::App.name
	user_created_by = rand(1..11)
	Event.create(name: event_name, date: Date.today + rand(1000), place: Faker::Address.street_name, made_by_user_id: user_created_by)
end


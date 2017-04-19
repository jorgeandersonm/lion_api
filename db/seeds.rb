# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..10).each do
	Individual.create!(
		email: Faker::Internet.email,
		name: Faker::Name.name,
		address: Faker::Address.street_address,
		city: Faker::Address.city,
		gender: 'male',
		age: Faker::Number.between(18, 67),
		auditor: false,
		password: '123123'
	)
end

Individual.all.each do |individual|
	(1..5).each do 
		individual.goods.create!(
			name: Faker::Commerce.product_name,
    	category: Faker::Commerce.department(2, true),
    	value: Faker::Commerce.price
    )
	end
end


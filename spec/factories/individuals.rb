FactoryGirl.define do
  factory :individual, class: Individual do
    email { Faker::Internet.email }
		name { Faker::Name.name }
		address { Faker::Address.street_address }
		city { Faker::Address.city }
		gender 'male'
		age 23
		auditor false
		password { Faker::Lorem.characters(8) }
  end
end

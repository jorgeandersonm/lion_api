FactoryGirl.define do
  factory :good, class: Good do
    name { Faker::Commerce.product_name }
    category { Faker::Commerce.department(2, true) }
    value { Faker::Commerce.price }
    individual_id 1
  end
end

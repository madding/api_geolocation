FactoryGirl.define do
  factory :ship do
    name { Faker::Name.unique.name }
    hold_capacity 9.99
  end
end

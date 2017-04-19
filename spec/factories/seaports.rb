FactoryGirl.define do
  factory :seaport do
    name { Faker::Name.unique.name }
    latitude 1.5
    longitude 1.5
  end
end

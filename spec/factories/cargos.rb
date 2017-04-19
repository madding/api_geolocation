FactoryGirl.define do
  factory :cargo do
    name { Faker::Name.unique.name }
    date { Date.today }
    seaport
    hold_capacity 9.99
  end
end

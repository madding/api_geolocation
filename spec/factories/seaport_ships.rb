FactoryGirl.define do
  factory :seaport_ship do
    date { Date.today }
    seaport
    ship
  end
end

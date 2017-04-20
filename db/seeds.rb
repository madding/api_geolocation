# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {
    "title" => "Dingle Harbour",
      "lat" => 52.13333333,
      "lng" => -10.26666667
  },
   {
    "title" => "Hirao",
      "lat" => 33.9,
      "lng" => 132.05
  },
   {
    "title" => "Humbug Point Wharf",
      "lat" => -12.66666667,
      "lng" => 141.8666667
  },
   {
    "title" => "Benghazi",
      "lat" => 32.1166,
      "lng" => 20.0833
  },
   {
    "title" => "Seaham",
      "lat" => 54.8333,
      "lng" => -1.3166
  },
   {
    "title" => "Blue Beach Harbour",
      "lat" => 48.78333333,
      "lng" => -58.78333333
  },
   {
    "title" => "Skamania County",
      "lat" => 45.68333333,
      "lng" => -121.8833333
  },
   {
    "title" => "Puerto de Calpe",
      "lat" => 0.0,
      "lng" => -0.3333333333
  }
].each do |seaport|
  Seaport.find_or_create_by(name: seaport['title'], latitude: seaport['lat'], longitude: seaport['lng'])
end

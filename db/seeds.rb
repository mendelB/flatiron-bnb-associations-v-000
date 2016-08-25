10.times { User.create(name: Faker::Name.name) }

2.times do
  city = City.create(name: Faker::Address.city )
  3.times { city.neighborhoods.create(name: Faker::Address.city )}
end
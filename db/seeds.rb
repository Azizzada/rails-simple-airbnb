puts "clean"

Flat.destroy_all

puts "create"

4.times do
  flat = Flat.create!(
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    description: Faker::Marketing.buzzwords,
    price_per_night: rand(40..100),
    number_of_guests: rand(1..4)
  )
  puts "Flat #{flat.id} been created"
end

puts "finish"

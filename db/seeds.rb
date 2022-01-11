# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating users...'
User.create!([
  {email: "testadmin@eieji.co.uk", password: "testadminuser"},
  {email: "testuser@feik.co.uk", password: "testuseraccount"},
  {email: "testcustomer@olej.co.uk", password: "testcustomeruser"}
])

puts 'Creating animals...'
Animal.create!({
    name: "Seahorse",
    species: "fish",
    address: "18 Rue Beautreillis, 75004 Paris, France",
    user_id: 1
})
Animal.create!({
    name: "Tiger",
    species: "feline",
    address: "Van Arteveldestraat 1, 1000 Brussels, Belgium",
    user_id: 2
})
puts 'Finished!'

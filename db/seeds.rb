# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creando usuario: admin@srenvio.com password: renvios@321"
User.create({ email: 'admin@srenvio.com', password: 'renvios@321', password_confirmation: 'renvios@321'})

puts 'Creando transportistas'
Carrier.create({name: 'Fedex'})
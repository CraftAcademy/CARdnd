# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Automobile.destroy_all
User.destroy_all
Rental.destroy_all
User.create(first_name: 'Owner', last_name: 'User',email: 'owner@mail.com', password: 'password', address: 'awesome street', phone: '897765422',driving_age: 9,age: 30 )
User.create( first_name: 'Rental', last_name: 'User',email: 'renter@mail.com', password: 'password', address: 'awesome street', phone: '897765422',driving_age: 9,age: 30 )
Automobile.create(brand: "Volvo", model: "V60", year: 1985, price: 540, user_id: 1,rental_status: true)
Automobile.create(brand: "Tolvo", model: "T01", year: 1990, price: 400, user_id: 1, rental_status: true)
Automobile.create(brand: "Polvo", model: "P60", year: 1981, price: 850, user_id: 1,rental_status: false)
Rental.create(automobile_id:1, user_id:2)
Rental.create(automobile_id:2, user_id:2)

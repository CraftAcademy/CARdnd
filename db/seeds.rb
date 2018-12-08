# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Automobile.destroy_all
User.destroy_all
User.create(id:2, first_name: 'Greg', last_name: 'Kallai',email: 'real@mail.com', password: 'password', address: 'awesome street', phone: '897765422',driving_age: 9,age: 30 )
Automobile.create(brand: "Volvo", model: "V60", year: 1985, price: 540, user_id: 2)
Automobile.create(brand: "Tolvo", model: "T01", year: 1990, price: 400, user_id: 2)
Automobile.create(brand: "Polvo", model: "P60", year: 1981, price: 850, user_id: 2)
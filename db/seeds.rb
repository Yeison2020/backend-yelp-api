# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create(username: "bobiscool", email: "bobiscool@123.com")
sam = User.create(username: "samiam", email: "samiam@123.com")

starbucks = Business.create(name: "Starbucks", category: "cafe", city: "north pole", state: "california", zip_code: 100099)
mcdonalds = Business.create(name: "McDonalds", category: "fast-food", city: "south pole", state: "california", zip_code: 100099)
dennys = Business.create(name: "Dennys", category: "diner", city: "los angeles", state: "california", zip_code: 100099)

Review.create(user_id: bob.id, business_id: starbucks.id, content: 'Hello the best website ever Thanks')
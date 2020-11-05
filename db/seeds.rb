# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Cardimeter", last_name: "Administrator", email: "admin@cardimeter.com", password: "admin123", is_admin: true)
Company.create([{ name: "CardinalStone Limited" }, { name: "Loystar Solutions Limited" }, { name: "Access Bank Plc" },
                { name: "Exxonmobil Limited" }, { name: "Honeywell UOP" }, { name: "Flour Mills Nigeria" }])

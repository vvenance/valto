# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'begin seeds'
puts 'destroying tables'

Phone.destroy_all
Command.destroy_all
InvoiceDatum.destroy_all

puts 'tables destroyed'
puts 'creating seeds'

phone1 = Phone.new(number: '0657687890', called: false).save
phone2 = Phone.new(number: '0657688890', called: false).save
phone3 = Phone.new(number: '0657687360', called: true).save

command1 = Command.new(name: "one project", status: false, user_id: 2).save
command2 = Command.new(name: "another project", status: true, user_id: 2).save

invoice_data = InvoiceDatum.new(compagny_name: "FakeCompagny", adress: "5 fake street 42000 FakeTown", number: '0987654321', siren: '123456789098', user_id: 2).save

puts 'seeds created'

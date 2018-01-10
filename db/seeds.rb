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
InvoiceDatum.destroy_all
Invoice.destroy_all
Contract.destroy_all
Estimate.destroy_all
Command.destroy_all
User.destroy_all



puts 'tables destroyed'
puts 'creating seeds'

User.create(email: 'admin@admin.fr', password: 'password', admin: true)
user = User.create(email: 'user@user.fr', password: 'password', admin: false)
user2 = User.create(email: 'user2@user.fr', password: 'password', admin: false)

Phone.create(number: '0657687890', called: false)
Phone.create(number: '0657688890', called: false)
Phone.create(number: '0657687360', called: true)

command = Command.create(name: "one project", status: false, user: user)
Command.create(name: "another project", status: true, user: user)
Command.create(name: "one project2", status: false, user: user2)
Command.create(name: "another project2", status: true, user: user2)

ii = Invoice.create(status: false, command: command, invoice_file: 'fake invoice file')

i = InvoiceDatum.create(compagny_name: "FakeCompagny", adress: "5 fake street 42000 FakeTown", number: '0987654321', siren: '123456789098', user: user)
InvoiceDatum.create(compagny_name: "FakeCompagny2", adress: "5 2fake street 42000 FakeTown", number: '0987654789', siren: '123456785398', user: user2)

Contract.create(command_id: command.id, contract_file: 'test')
Estimate.create(command_id: command.id, estimate_file: 'test')

puts 'seeds created'

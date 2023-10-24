# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
guillaume = User.create(email: "test1@gmail.com",
  password: "azerty",
  password_confirmation: "azerty",
  firstname: 'Guillaume',
  lastname: 'Malod',
  username: 'LeG')

xavier = User.create(email: "test2@gmail.com",
  password: "azerty",
  password_confirmation: "azerty",
  firstname: 'Xavier',
  lastname: 'Lejeune',
  username: 'ProfesseurX')

Group.destroy_all
sec = Group.create(name: '2nde 1', user: guillaume)
prem = Group.create(name: '1ere 4', user: guillaume)
term = Group.create(name: 'Term 4', user: xavier)

gaston = Student.create(firstname: 'Gaston', lastname: 'Brouard', group: sec)
mohamed = Student.create(firstname: 'Mohamed', lastname: 'Mohamed', group: sec)
theo = Student.create(firstname: 'Théo', lastname: 'Patissier', group: sec)

mathis = Student.create(firstname: 'Mathis', lastname: 'Segpa', group: prem)
ryunosuke = Student.create(firstname: 'Ryunosuke', lastname: 'Kitahara', group: prem)
romuald = Student.create(firstname: 'Romuald', lastname: 'Branlieux', group: prem)

rakator = Student.create(firstname: 'Rakator', lastname: 'Grouet', group: term)
sisoko = Student.create(firstname: 'Sisoko', lastname: 'Sounok', group: term)
jean = Student.create(firstname: 'Jean', lastname: 'Jean', group: term)

Note.create(description: 'Ajd Mohamed a bien travaillé', student: mohamed)
Note.create(description: 'Romuald me doit 2e', student: romuald)
Note.create(description: 'Sisoko doit faire plus d\'efforts', student: sisoko)

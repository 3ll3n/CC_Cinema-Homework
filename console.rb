require('pry-byebug')

require_relative('Customer')
require_relative('Film')
require_relative('Ticket')

customer1 = Customer.new({'name' => 'Sandra', 'funds' => 25})
customer2 = Customer.new({'name' => 'Ryan', 'funds' => 15})

customer1.save
customer2.save

film1 = Film.new({'title' => 'The Proposal', 'price' => 5})
film2 = Film.new({'title' => 'Two Weeks Notice', 'price' => 4})

film1.save
film2.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'time' => '20:00'})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id, 'time' => '21:00'})

ticket1.save
ticket2.save

binding.pry

nil

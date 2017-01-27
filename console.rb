require('pry-byebug')

require_relative('Customer')
require_relative('Film')
require_relative('Ticket')

customer1 = Customer.new({'name' => 'Sandra', 'funds' => 25})
customer2 = Customer.new({'name' => 'Ryan', 'funds' => 15})

film1 = Film.new({'title' => 'The Proposal', 'price' => 5})
film2 = Film.new({'title' => 'Two Weeks Notice', 'price' => 4})

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})

binding.pry

nil

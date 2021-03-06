require_relative('db/sqlrunner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING id;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    return result.map { |customer| Customer.new(customer) }
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def buy_ticket(film)
    if @funds >= film.price
      @funds -= film.price
      new_ticket = Ticket.new({'customer_id' => @id , 'film_id' => film.id})
      new_ticket.save
    end    
  end

  def bought_tickets()
    sql = "SELECT COUNT(*) bought_tickets FROM tickets WHERE customer_id = #{@id};"
    return SqlRunner.run(sql).first['bought_tickets'].to_i
  end

  def self.count_customers_watching_film(film)
    sql = "SELECT COUNT(*) count_customers_watching_film FROM customers c INNER JOIN tickets t ON t.customer_id = c.id WHERE t.film_id = #{film.id};"
    return SqlRunner.run(sql).first['count_customers_watching_film'].to_i
  end

end
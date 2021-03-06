require_relative('db/sqlrunner')

class Ticket
  
  attr_reader :id, :customer_id, :film_id, :time

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, time) VALUES (#{@customer_id}, #{@film_id}, '#{@time}') RETURNING id;"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id, time) = (#{@customer_id}, #{@film_id}, #{@time}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql)
    return result.map { |ticket| Ticket.new(ticket) }
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

# most tickets sold
  def self.most_popular_time(time)

  end


end
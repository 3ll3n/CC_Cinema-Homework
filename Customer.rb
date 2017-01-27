require_relative('../db/sqlrunner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end

  def save()
  end

  def update()
  end

  def delete()
  end

end
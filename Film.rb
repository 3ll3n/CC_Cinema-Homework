require_relative('../db/sqlrunner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

  def save()
  end

  def update()
  end

  def delete()
  end



end
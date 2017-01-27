require('pg')

require_relative('../Customer')
require_relative('../Film')
require_relative('../Ticket')

class SqlRunner()

  def self.run(sql)
    begin
      db = PG.connect({dbname:'CC_Cinema', host: 'localhost'})
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end

end
require_relative("../db/sql_runner.rb")

class Member

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @email = options["email"]
    @phone = options["phone"].to_i()
  end

  def save()
    sql = "INSERT INTO members (name, email, phone) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end
  

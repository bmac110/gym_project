require_relative("../db/sql_runner.rb")

class Member

  attr_accessor :first_name, :last_name, :email, :phone, :membership
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @email = options["email"]
    @phone = options["phone"].to_i()
    @membership = options["membership"]
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, email, phone, membership)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

end

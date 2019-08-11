require_relative("../db/sql_runner.rb")

class Member

  attr_accessor :first_name, :last_name, :email, :phone, :membership
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @email = options["email"]
    @phone = options["phone"]
    @membership = options["membership"]
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, email, phone, membership)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@first_name, @last_name, @email, @phone, @membership ]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end



  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map{|member| Member.new(member)}
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first)
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name,
    email, phone, membership)
    = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @last_name, @email, @phone, @membership, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def gym_classes()
    sql = "SELECT g.* FROM gym_classes g INNER JOIN bookings b
    ON b.gym_class_id = g.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gymclass| GymClass.new(gymclass) }
  end

  def format_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

end

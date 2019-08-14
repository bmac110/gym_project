require_relative("../db/sql_runner.rb")

class GymClass

  attr_accessor :title, :instructor, :capacity, :start_time
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @instructor = options["instructor"]
    @capacity = options["capacity"].to_i()
    @start_time = options["start_time"]
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO gym_classes (title, instructor, capacity, start_time)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @instructor, @capacity, @start_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map{|gymclass| GymClass.new(gymclass)}
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return GymClass.new(results.first)
  end

  def update()
    sql = "UPDATE gym_classes SET (title, instructor, capacity, start_time)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@title, @instructor, @capacity, @start_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.gym_class_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  



end

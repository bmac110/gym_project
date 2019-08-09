require_relative("../db/sql_runner.rb")

class GymClass

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @title = options["title"]
    @instructor = options["instructor"]
    @capacity = options["capacity"]
    @class_time = options["class_time"]
  end

  def save()
    sql = "INSERT INTO gym_classes (title, instructor, capacity, class_time)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @instructor, @capacity, @class_time]
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
    sql = "UPDATE gym_classes SET (title, instructor, capacity, class_time)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@title, @instructor, @capacity, @class_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

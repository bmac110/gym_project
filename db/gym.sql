DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  membership VARCHAR(255)
);

CREATE TABLE gym_classes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  instructor VARCHAR(255),
  capacity VARCHAR(255),
  start_time VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INT REFERENCES members(id),
  gym_class_id INT REFERENCES gym_classes(id)
);

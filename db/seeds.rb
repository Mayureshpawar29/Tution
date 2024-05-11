# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

course1 = Course.create(
  title: 'Introduction to Ruby on Rails',
  description: 'Learn the fundamentals of Ruby on Rails and build your first web application.',
  start_date: Date.today,
  end_date: Date.today + 2.months
)

course2 = Course.create(
  title: 'Advanced Ruby on Rails',
  description: 'Dive deeper into Ruby on Rails and explore advanced concepts and techniques.',
  start_date: Date.today + 3.months,
  end_date: Date.today + 5.months
)

course3 = Course.create(
  title: 'React.js Fundamentals',
  description: 'Learn to build modern and interactive user interfaces with React.js.',
  start_date: Date.today + 6.months,
  end_date: Date.today + 8.months
)

course4 = Course.create(
  title: 'Node.js and Express',
  description: 'Develop server-side applications using Node.js and the Express.js framework.',
  start_date: Date.today + 9.months,
  end_date: Date.today + 11.months
)

course5 = Course.create(
  title: 'Python for Data Science',
  description: 'Explore data analysis, machine learning, and data visualization using Python.',
  start_date: Date.today + 12.months,
  end_date: Date.today + 14.months
)

tutor1 = course1.tutors.create(
  name: 'Rahul Sharma',
  email: 'rahul.sharma@example.com'
)

tutor2 = course1.tutors.create(
  name: 'Rohan Gupta',
  email: 'rohan.gupta@example.com'
)

tutor3 = course2.tutors.create(
  name: 'Michael Johnson',
  email: 'michael.johnson@example.com'
)

tutor4 = course2.tutors.create(
  name: 'Priya Desai',
  email: 'priya.desai@example.com'
)

tutor5 = course3.tutors.create(
  name: 'David Wilson',
  email: 'david.wilson@example.com'
)

tutor6 = course3.tutors.create(
  name: 'Sarah Thompson',
  email: 'sarah.thompson@example.com'
)

tutor7 = course4.tutors.create(
  name: 'Robert Anderson',
  email: 'robert.anderson@example.com'
)

tutor8 = course5.tutors.create(
  name: 'Jessica Taylor',
  email: 'jessica.taylor@example.com'
)

tutor9 = course5.tutors.create(
  name: 'Aditya Patel',
  email: 'aditya.patel@example.com'
)

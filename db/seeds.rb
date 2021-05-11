# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(username:"frogers", first_name: "Fred", last_name: "Rogers", password:"test")
Student.create(username:"smcqueen", first_name: "Steve", last_name: "McQueen", password:"test")

Teacher.create(username:"ekelly", first_name: "Emmett", last_name: "Kelly", password:"test")
Teacher.create(username:"ljacobs", first_name: "Lou", last_name: "Jacobs", password:"test")
Teacher.create(username:"opopov", first_name: "Oleg", last_name: "Popov", password:"test")
Teacher.create(username:"gfox", first_name: "George", last_name: "Fox", password:"test")

Course.create(name: "Clowning 101", description: "Beginner makeup, pranks, and prat falls.", teacher_id: 1)
Course.create(name: "Clowning 102", description: "Intermediate makeup, pranks, and prat falls.", teacher_id: 1)
Course.create(name: "Clowning 103", description: "Advanced makeup, pranks, and prat falls.", teacher_id: 2)
Course.create(name: "Juggling 155", description: "Intro to most common juggling forms.", teacher_id: 3)
Course.create(name: "Mime 201", description: "Beginning techniques in mime.", teacher_id: 4)
Course.create(name: "Mime 301", description: "Advanced techniques in mime.", teacher_id: 4)

Activity.create(name: "Famous Clowns", description: "Students meet to discuss famous clowns and their impact on the art of clowning", teacher_id: 1)
Activity.create( name: "Clown Shoe Running Club", description: "Put on your biggest clown shoes and join fellow students on campus runs.", teacher_id: 2)

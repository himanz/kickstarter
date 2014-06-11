# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


array = ["Art", "Comics", "Design", "Film & Video", "Games", "Music", "Photography", "Technology"]

100.times do
  Project.create ({
    title: Faker::Company.catch_phrase,
    description: Faker::Company.bs,
    goal: rand(10000..100000),
    category: array[rand(0..(array.length - 1))],
    start_date: DateTime.new(2014,4,20,19),
    end_date: DateTime.new(2014,6,1,19)
    })
end
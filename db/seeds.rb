# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Commercial", linkname: "questions_commercial")
Category.create(name: "IP", linkname: "questions_ip")
Category.create(name: "Employment", linkname: "questions_employment")
Category.create(name: "Real Estate", linkname: "questions_real_estate")
Category.create(name: "Venture Capital", linkname: "questions_venture_cap")

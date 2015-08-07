# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.


start_date = Date.parse(3.months.ago.to_s)
end_date = Date.today

start_date.upto(end_date).to_a.each do |date|
  rand(1..5).times do # 1 to 5 payments each day
    payment = Payment.create( value: rand(1000..100000)) # 
    payment.update_attribute(:created_at, date)
  end
end

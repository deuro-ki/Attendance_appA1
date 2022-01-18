#coding :utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
User.create!(name: "上長A",
             email: "superior-A@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)
             
User.create!(name: "上長B",
             email: "superior-B@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)

10.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password)

end




#(Date.parse('2021-01-01')..Date.parse('2022-12-31')).select{|d| d.day == 1}.each do |day|
#first_day = day
user = User.find(2)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(2)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}



user = User.find(3)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(3)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(4)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(4)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(4)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(5)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day =  Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(5)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(5)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(6)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(6)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(6)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(7)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(7)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(8)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(8)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(9)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(9)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}



user = User.find(10)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(10)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(11)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(11)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}



user = User.find(12)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}


user = User.find(12)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day =  Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(12)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




user = User.find(13)
first_day = Date.current.beginning_of_month
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 1, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 4, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 5, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 6, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 7, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 8, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 9, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 10, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day =  Date.new(2021, 11, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2021, 12, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2022, 2, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}

user = User.find(13)
first_day = Date.new(2022, 3, 1)
last_day = first_day.end_of_month
one_month = [*first_day..last_day]
one_month.each {|day| user.attendances.create!(worked_on: day)}




puts "Users Created"
puts "Attendances Created"

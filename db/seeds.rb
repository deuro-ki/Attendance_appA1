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





puts "Users Created"
puts "Attendances Created"

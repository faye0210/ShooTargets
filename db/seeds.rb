# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               uid: "#{i + 1}",
               provider: "#{i + 1}"
               )
end

15.times do |i|
  title = Faker::JapaneseMedia::Naruto.character
  detail = Faker::Quotes::Shakespeare
  Target.create!(title: title,
                detail: detail,
                status: false,
                deadline: DateTime.now,
                user_id: User.first.id
                )
end

5.times do |i|
  title = Faker::JapaneseMedia::Naruto.character
  detail = Faker::Quotes::Shakespeare
  Target.create!(title: title,
                  detail: detail,
                  status: true,
                  deadline: DateTime.now,
                  user_id: User.first.id
                  )
end

5.times do |i|
  title = Faker::JapaneseMedia::Naruto.character
  detail = Faker::Quotes::Shakespeare
  Target.create!(title: title,
                  detail: detail,
                  status: true,
                  deadline: DateTime.now,
                  user_id: User.last.id
                  )
end

FactoryBot.define do
  factory :user do
    name { "user1" }
    sequence(email) { |n| "user#{n}@sample.com" }
    password { "password" }
    sequence(provider) { |n| "#{n}"}
    sequence(uid) { |n| "#{n}"}
  end
  factory :second_user, class: User do
    name { "user2" }
    sequence(email) { |n| "user#{n}@sample.com" }
    password { "password" }
    sequence(provider) { |n| "#{n}"}
    sequence(uid) { |n| "#{n}"}
  end
end

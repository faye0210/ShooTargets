FactoryBot.define do
  factory :list do
    title { "MyString" }
    deadline { "2021-03-08" }
    user { nil }
    status { false }
  end
end

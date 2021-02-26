FactoryBot.define do
  factory :target do
    title { "target1" }
    detail { "testestestestestestest" }
    deadline { DateTime.now }
    status { false }
    association :user
  end

  factory :second_target, class: Target do
    title { "target2" }
    detail { "test2test2test2estestestest" }
    deadline { DateTime.now }
    status { true }
    association :second_user
  end

  factory :third_target, class: Target do
    title { "target3" }
    detail { "test2test2test2estestestest" }
    deadline { DateTime.now }
    status { true }
    association :second_user
  end
end

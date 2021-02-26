FactoryBot.define do
  factory :target do
    title { "target1" }
    detail { "testestestestestestest" }
    deadline { DateTime.tomorrow }
    status { false }
    association :user
  end

  factory :second_target, class: Target do
    title { "target2" }
    detail { "test2test2test2estestestest" }
    deadline { DateTime.tomorrow }
    status { true }
    association :second_user
  end

  factory :third_target, class: Target do
    title { "target3" }
    detail { "test3test3test3estestestest" }
    deadline { DateTime.tomorrow }
    status { true }
    association :user
  end
end

FactoryBot.define do
  factory :parent_user, class: User, aliases: [:parent] do
    name {'テスト 親一郎'}
    email {'test@example.com'}
    password {'test_password'}
  end

  factory :child_user, class: User do
    name {'テスト 子太郎'}
    sequence(:email) { |n| "tester#{n}@example.com" }
    password {'test_password'}
    association :parent
  end
end

FactoryBot.define do
  factory :parent_user, class: User, aliases: [:parent] do
    name {'テスト 親一郎'}
    email {'tester@example.com'}
    password {'test_password'}
  end

  factory :child_user, class: User, aliases: [:user]  do
    name {'テスト 子太郎'}
    email {'kotaro@example.com'}
    password {'test_password'}
    association :parent
  end

end

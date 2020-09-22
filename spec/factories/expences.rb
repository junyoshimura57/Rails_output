FactoryBot.define do
  factory :expence do
    name { 'うまい棒'}
    amount {100}
    association :user, factory: :child_user
  end
end

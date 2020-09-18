FactoryBot.define do
  factory :expence do
    name {'うまい棒'}
    amount {100}
    association :user
  end
end

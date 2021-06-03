FactoryBot.define do
  factory :account do
    name { "MyString" }
    user { nil }
    active { false }
    investment { false }
  end
end

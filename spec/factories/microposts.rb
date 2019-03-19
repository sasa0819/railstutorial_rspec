FactoryBot.define do
  factory :micropost do
    content "My micropost"
    association :user
  end
end

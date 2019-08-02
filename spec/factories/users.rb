# FactoryBot.define do
#   factory :user do
#     email "test1@example.com"
#     password "123456"
#   end
# end

FactoryBot.modify do
  factory :user do
    sequence(:email){|n|"test#{n}@example.com"}
    password {"123456"}
  end
end
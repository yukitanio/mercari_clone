FactoryBot.define do
  factory :profile do
    name { "MyString" }
    picture { "MyString" }
    content { "MyText" }
    user { nil }
  end
end

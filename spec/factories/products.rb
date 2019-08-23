FactoryBot.define do
  factory :product do
    name {'リュック'}
    price {2000}
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/item_1.png')) }
    association :user
  end
end

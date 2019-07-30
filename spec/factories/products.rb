FactoryBot.define do
    factory :product do
        name {'リュック'}
        content {'リュックです'}
        price {2000}
        picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/item_1.png')) }
    end
end
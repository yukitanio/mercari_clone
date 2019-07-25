class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    default_scope -> { order(created_at: :desc) }
end

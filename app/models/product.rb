class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    default_scope -> { order(created_at: :desc) }
    enum categories: [:ファッション, :バッグ, :スポーツ用品, :電子機器, :アウトドア, :その他]
end

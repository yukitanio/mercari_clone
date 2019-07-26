class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    default_scope -> { order(created_at: :desc) }
    enum categories: [:ファッション, :バッグ, :スポーツ用品, :電子機器, :アウトドア, :その他]
    enum status: [:非常に良い, :良い, :普通,:悪い,:非常に悪い]
    enum transaction_status: [:販売中, :取引中, :売却済み]
end

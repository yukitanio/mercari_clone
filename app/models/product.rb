class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    enum categories: [:ファッション, :バッグ, :スポーツ用品, :電子機器, :アウトドア, :その他]
    enum status: [:verygood, :good, :normal, :bad, :verybad ]
    enum transaction_status: [:purchase, :inprocess, :sold]
    validates :name, presence: true
    validates :picture, presence: true
    validates :price, presence: true
    validates :content, length: {maximum: 250}
end

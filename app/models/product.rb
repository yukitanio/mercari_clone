class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    enum status: [:verygood, :good, :normal, :bad, :verybad ]
    enum transaction_status: [:purchase, :inprocess, :sold]
    validates :name, presence: true
    validates :picture, presence: true
    validates :price, presence: true, numericality: { only_integer: true }
    validates :content, length: {maximum: 250}
    paginates_per 40
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :purchases
    has_many :users, through: :purchases
    belongs_to :user
    has_many :likes
    has_many :userlikes, through: :purchases, source: :user

end

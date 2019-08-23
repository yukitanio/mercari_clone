class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  enum status: %i(verygood good normal bad verybad)
  enum transaction_status: %i(purchase inprocess sold)
  validates :name, presence: true
  validates :picture, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :content, length: {maximum: 250}
  paginates_per 40
  has_many :product_categories
  has_many :categories, through: :product_categories
  belongs_to :user
  has_many :purchases
  has_many :purchasers, through: :purchases, source: :user
  has_many :likes
  has_many :userlikes, through: :purchases, source: :user
end

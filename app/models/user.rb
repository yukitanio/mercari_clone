class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchases
  has_many :productpurchases, through: :purchases, source: :product
  has_many :likes
  has_many :productlikes, through: :likes, source: :product

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end
end

class Profile < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  validates :name, presence: true
  validates :content, length: {maximum: 250}
end

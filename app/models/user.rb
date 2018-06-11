class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :name, :surname, :title, :gender, presence: true
  validates :email, presence: true, uniqueness: true
end

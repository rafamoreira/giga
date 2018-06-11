class User < ApplicationRecord
  validates :name, :surname, :title, :gender, presence: true
  validates :email, presence: true, uniqueness: true
end

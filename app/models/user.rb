class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
  include PgSearch

  validates :name, :surname, :title, :gender, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    "#{name} #{surname}".titleize
  end

  def self.search(query)
    query ? search_by_name(query) : all
  end

  pg_search_scope :search_by_name, against: [:name, :surname]
end

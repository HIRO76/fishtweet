class Article < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  # has_one_attached :image
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  # def thumbnail
  #   if images.count > 1

  # end
end

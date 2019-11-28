class Article < ApplicationRecord
  has_many_attached :images, dependent: :destroy_all
  has_many :comments, dependent: :destroy_all
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, presence: true
end

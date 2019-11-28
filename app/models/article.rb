class Article < ApplicationRecord
  has_many :images, dependent: :destroy_all
  has_many :comments, dependent: :destroy_all
  belongs_to :user
end

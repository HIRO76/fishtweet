class Article < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true 
  validates :body, presence: true
  # validates :images_presence, presence: true

  # def images_presence
  #   if images.attached?
  #     if ！images.content_type.in?(%("images/jpeg images/png"))
  #       errors.add(:images, "jpeg or png をご利用ください")
  #     end
  #   else
  #     errors.add(:images, "画像を添付してください")
  #   end
  # end
end

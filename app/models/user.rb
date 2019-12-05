class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_many :articles, dependent: :destroy
  has_many :comments
end

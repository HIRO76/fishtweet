class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_many :articles, dependent: :destroy
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 10, message: "10文字以内で入力してください。" }
  validates :email, presence: true, uniqueness: { message: "メールアドレスに誤りがあります。ご確認ください。" }
  validates :password, presence: true, confirmation: { message: "パスワードが一致しません。" }, length: { minimum: 6, message: "6文字以上で入力してください。" }
  validates :password_confirmation, presence: true
end

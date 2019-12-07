require 'rails_helper'
require 'factory_bot'

describe User do
  describe '新規登録' do

    it "全ての条件が整えばユーザー登録ができる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが10文字以内であれば登録できる" do
      user = build(:user, nickname: "nickname")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが10文字以上だったら登録できない" do
      user = build(:user, nickname: "nicknamenickname")
      user.valid?
      expect(user.errors[:nickname]).to include("10文字以内で入力してください。")
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailが重複していると登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("メールアドレスに誤りがあります。ご確認ください。")
    end

    it "passwordが空だと登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("6文字以上で入力してください。")
    end

    it "passwordが6文字以上であれば登録できる" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以内だと登録できない" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("6文字以上で入力してください。")
    end

    it "password_cofirmationが空だと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end
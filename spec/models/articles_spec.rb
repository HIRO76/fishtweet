require 'rails_helper'
require 'factory_bot'

describe Article do
  describe '記事作成' do
    context '記事が保存できる' do
      it 'bodyがあれば保存できる' do
        expect(build(:article, title: nil)).to be_valid
      end
      it 'titleがあれば保存できる' do
        expect(build(:article, body: nil)).to be_valid
      end
      it 'body,titleがあれば保存できる' do
        expect(build(:article)).to be_valid
      end
    end

    context '記事が保存できない' do
      it 'bodyが空だと保存できない' do
        article = build(:article, body: nil)
        article.valid?
        expect(article.error[:body]).to include("記事を入力してください")
      end
      it 'titleが空だと保存できない' do
        article = build(:article, title: nil)
        article.valid?
        expect(article.error[:title]).to include("タイトルを入力してください")
      end
      it 'body,titleが空だと保存できない' do
        expect(build(:article)).to be_valid
      end
    end

    before do 
      user_A = create(:user, nickname: 'ユーザーA', email: 'user_A@example.com')
      create(:article, title: 'テスト投稿', user: user_A)
    end
    context 'ユーザーAがログインしている時' do
      before do 
        visit login_path
        fill_in 'メールアドレス', with: 'testA@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end
      it "ユーザーAが投稿した記事が表示される" do
        expect(page).to have_content 'テスト投稿'
      end
    end
  end
end

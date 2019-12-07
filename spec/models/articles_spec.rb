require 'rails_helper'
require 'factory_bot'

describe Article do
  describe '記事作成' do
    context '記事が保存できる' do
      it 'bodyがあれば保存できる' do
        expect(build(:article, title: "title")).to be_valid
      end
      it 'titleがあれば保存できる' do
        expect(build(:article, body: "body")).to be_valid
      end
      it 'body,titleがあれば保存できる' do
        expect(build(:article)).to be_valid
      end
    end

    context '記事が保存できない' do
      it 'bodyが空だと保存できない' do
        article = build(:article, body: nil)
        article.valid?
        expect(article.errors[:body]).to include("を入力してください")
      end
      it 'titleが空だと保存できない' do
        article = build(:article, title: nil)
        article.valid?
        expect(article.errors[:title]).to include("を入力してください")
      end
      it 'body,titleが空だと保存できない' do
        article = build(:article, body: nil, title: nil)
        article.valid?
        expect(article.errors[:body]).to include("を入力してください")
      end
    end
  end
end

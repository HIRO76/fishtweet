require 'rails_helper'

feature 'article', type: :feature do 
  let(:user) { create(:user) }
  scenario '記事投稿' do 
    # signin前
    visit root_path
    click_on('投稿する')
    expect(page).to eq new_article_path

    # signin
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[type="submit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログインしました')

    # post
    expect {
      click_on('投稿する')
      expect(current_path).to eq new_article_path
      fill_in 'article[title]', with: '統合テスト'
      fill_in 'article[body]',  with: 'Rspec フューチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Article, :count).by(1)
  end

  scenario '記事投稿失敗' do 
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[type="submit"]').click

    visit root_path
    visit new_article_path
    fill_in 'article[title]', with: ""
    fill_in 'article[body]', with: ""
    find('input[type="submit"]').click
    expect(article.errors[:title]).to heve_content("記事を入力してください")
    expect(article.errors[:body]).to heve_content("記事を入力してください")
  end
end

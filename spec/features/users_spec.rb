require 'rails_helper'

feature 'user update and delete' do
  scenario "ユーザー情報を変更する" do
      visit root_path
      expect(page).to have_http_status :ok

      click_link "さっそく登録!"
      fill_in "メールアドレス", with: 'foo@example.com'
      fill_in "ユーザーネーム", with: 'sasa'
      fill_in "パスワード", with: 'test'
      fill_in "確認用パスワード", with: 'test'
      click_on 'ユーザー登録'

      expect(page).to have_content "アカウント登録が完了しました。"

      click_on "ユーザー編集"
      fill_in "ユーザーネーム", with: 'sasa190'
      fill_in "自己紹介", with: 'こんにちは'
      fill_in "現在のパスワード", with: "test"
      click_on '編集する'

      expect(page).to have_content "アカウント情報を変更しました。"
  end
end

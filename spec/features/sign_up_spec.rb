require 'rails_helper'

feature 'Sign up' do
  scenario "ユーザー登録を行う" do
    visit root_path
    expect(page).to have_http_status :ok

    click_link "さっそく登録!"
    fill_in "メールアドレス", with: 'foo@example.com'
    fill_in "ユーザーネーム", with: 'sasa'
    fill_in "パスワード", with: 'test'
    fill_in "確認用パスワード", with: 'test'
    click_on 'ユーザー登録'

    expect(page).to have_content "アカウント登録が完了しました。"
  end
end

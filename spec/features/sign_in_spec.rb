require 'rails_helper'

feature 'Sign in' do
  scenario "ログインする" do
    user = create(:user)
    visit root_path
    expect(page).to have_http_status :ok

    click_link "Login"
    fill_in "メールアドレス", with: 'test@example.com'
    fill_in "パスワード", with: 'test'
    click_on "ログイン"
    expect(page).to have_content "ログインしました。"
  end
end
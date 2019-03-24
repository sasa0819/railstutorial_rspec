require 'rails_helper'

RSpec.feature "Go to link", type: :feature do
  scenario "リンクを行き来する" do
    visit root_path
    click_link "Help"

    expect(page).to have_title "Help - Diver SNS"

    visit helf_path
    click_link "Home"

    expect(page).to have_content "Diver SNS"
  end
end

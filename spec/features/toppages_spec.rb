require 'rails_helper'

RSpec.feature "Toppages", type: :feature do
  scenario "user move links" do
    visit root_path
    click_link "Help"

    expect(page).to have_title "Help - Diver SNS"

    visit helf_path
    click_link "Home"

    expect(page).to have_content "Diver SNS"
    expect(page).to have_title "Diver SNS"
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "is valid with a username email password" do
    user = @user
    expect(user).to be_valid
  end

  it "is invalid username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("が入力されていません。")
  end

  it "is invalid email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
end

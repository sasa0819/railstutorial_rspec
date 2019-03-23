require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @micropost = FactoryBot.create(:micropost)
  end

  it "valid with micropost" do
    micropost = @micropost
    expect(micropost).to be_valid
  end

  # it "invalid with micropost" do
  #   micropost = Micropost.new(content: nil)
  #   micropost.valid?
  #   expect(micropost.errors[:micropost]).to include("を入力してください")
  # end
end

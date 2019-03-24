require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @micropost = FactoryBot.create(:micropost)
  end

  it "valid with micropost" do
    micropost = @micropost
    expect(micropost).to be_valid
  end

end

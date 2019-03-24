require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  describe "GET/new" do
    context "ログインしている場合" do
      let(:user) { create :user }

      before do
        sign_in user
        get new_micropost_path
      end

      it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

      it "タイトルが正しいこと" do
        expect(response.body).to include '写真投稿 - Diver SNS'
      end

      it "投稿フォームが存在すること" do
        expect(response.body).to include '写真投稿'
      end
    end

    context "ログインしていない場合" do
      it "ログインページにリダイレクトされること" do
        get new_micropost_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST/create' do
    it "マイクロポストを投稿できること" do
      user = create(:user)
      micropost_params = attributes_for(:micropost)
      sign_in user
      expect {
        post microposts_path, params: { micropost: micropost_params }
      }.to change(user.microposts, :count).by(1)
    end
  end
end
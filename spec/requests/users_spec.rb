require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /index' do
    let(:user) { create:user }

    it "リクエストが成功すること" do
      sign_in user
      get users_url
      expect(response.status).to eq 200
    end

    it "タイトルが正しいこと" do
      sign_in user
      get users_url
      expect(response.body).to include 'ユーザー一覧 - Diver SNS'
    end

    it "ビューが正しいこと" do
      sign_in user
      get users_url
      expect(response.body).to include 'ユーザー一覧'
    end
  end

  describe 'GET/show' do
    context 'ユーザーが存在する場合'
      let(:user) { create:user }

      it "リクエストが成功すること" do
        sign_in user
        get mypage_url user.id
        expect(response.status).to eq 200
      end

      it "ユーザー名が表示されていること" do
        sign_in user
        get mypage_url user.id
        expect(response.body).to include 'sasa'
      end
    end

    
end

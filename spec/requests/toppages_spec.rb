require 'rails_helper'

RSpec.describe "Toppages", type: :request do
  describe "GET /toppages" do
    context "ログインしていない場合" do
      before do
      get root_path
      end

      it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

      it "ビューが正しいこと" do
        expect(response.body).to include 'ダイビング好きによる情報交換型SNSサイトです.'
      end
    end

    context "ログインしている場合" do
      let(:user) { create :user }

      before do
        sign_in user
        get root_path
      end

      it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

      it "ビューが正しいこと" do
        expect(response.body).to include '投稿一覧'
      end
    end
  end

  describe "Get /help" do
    before do
      get helf_path
    end

    it "リクエストが成功すること" do
      expect(response.status).to eq 200
    end

    it "ビューが正しいこと" do
      expect(response.body).to include 'ヘルプページ'
    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /index' do
    context "ログインしている場合" do
      let(:user) { create :user }

      before do
        sign_in user
        get users_url
      end

      it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

      it "タイトルが正しいこと" do
        expect(response.body).to include 'ユーザー一覧 - Diver SNS'
      end

      it "ユーザー名が表示されていること" do
        expect(response.body).to include user.username
      end
    end

    context "ログインしていない場合" do
      it "ログインページにリダイレクトされること" do
        get users_url
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET/new' do
    before do
      get new_user_registration_path
    end

    it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

    it "タイトルが正しいこと" do
      expect(response.body).to include 'ユーザー登録 - Diver SNS'
    end

    it "ビューが正しいこと" do
      expect(response.body).to include 'ユーザー登録'
    end

    it "メールアドレス入力欄があること" do
      expect(response.body).to include 'メールアドレス'
    end

    it "ユーザーネーム入力欄があること" do
      expect(response.body).
      to include 'ユーザーネーム'
    end

    it "パスワード入力欄があること" do
      expect(response.body).to include 'パスワード'
    end

    it " 確認用パスワード入力欄があること" do
      expect(response.body).to include '確認用パスワード'
    end
  end

  describe 'GET/show' do
    context 'ユーザーが存在する場合' do
      before do
        sign_in user
        get mypage_url user.id
      end
      let(:user) { create :user }

      it "リクエストが成功すること" do
        expect(response.status).to eq 200
      end

      it "ユーザー名が表示されていること" do
        expect(response.body).to include user.username
      end

      it "フォローワーの数が表示されていること" do
        expect(response.body).to include 'フォローワー'
      end

      it "フォローしている人の数が表示されていること" do
        expect(response.body).to include 'フォロー'
      end
    end

    context 'ユーザーが存在しない場合' do

      it "ログインページにリダイレクトされること" do
        get mypage_url 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST/create" do
  end

  describe "PUT/update" do
  end

  describe "DELETE/destroy" do
  end
end

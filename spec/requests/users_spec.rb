require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET /index' do

    it "リクエストが成功すること" do
      get users_url
      expect(response.status).to eq 200
    end

    it "タイトルが正しいこと" do
      get users_url
      expect(response.body).to include 'ユーザー一覧 - Diver SNS'
    end

    it "ビューが正しいこと" do
      get users_url
      expect(response.body).to include 'ユーザー一覧'
    end
  end

  # describe 'GET/show' do
  #   context 'ユーザーが存在する場合'
  #     let(:user) { create:user }
  #
  #     it "リクエストが成功すること" do
  #       get mypage_url user.id
  #       expect(response.status).to eq 200
  #     end
  #
  #     it "ユーザー名が表示されていること" do
  #       get mypage_url user.id
  #       expect(response.body).to include 'sasa'
  #     end
  #   end
  #
  #   context 'ユーザーが存在しない場合' do
  #     subject { -> { get mypage_url 1 }}
  #
  #     it { is_expected.to raise_error ActiveRecord::RecordNotFound }
  #   end
end

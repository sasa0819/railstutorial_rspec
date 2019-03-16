require 'rails_helper'

RSpec.describe "Toppages", type: :request do
  describe "GET /toppages" do
    it "リクエストが成功すること" do
      get root_url
      expect(response.status).to eq 200
    end

    it "タイトルが正しいこと" do
      get root_url
      expect(response.body).to include 'Diver SNS'
    end

    it "ビューが正しいこと" do
      get root_url
      expect(response.body).to include 'ダイビング好きによる情報交換型SNSサイトです.'
    end
  end

  describe "GET/help" do
    it "リクエストが成功すること" do
      get helf_url
      expect(response.status).to eq 200
    end

    it "タイトルが正しいこと" do
      get helf_url
      expect(response.body).to include 'Help - Diver SNS'
    end

    it "ビューが正しいこと" do
      get helf_url
      expect(response.body).to include 'ヘルプページ'
    end
  end
end

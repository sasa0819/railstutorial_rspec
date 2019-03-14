require 'rails_helper'

RSpec.describe ToppagesController, type: :controller do
  describe "#root" do
    it "responds succesfully" do
      get :home
      expect(response).to be_success
    end
  end

  describe "#help" do
    it "response succesfully" do
      get :help
      expect(response).to be_success
    end
  end
end

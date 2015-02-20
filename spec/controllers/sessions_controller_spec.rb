require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET create" do
    it "returns http success" do
      pending 'need a auth_hash'
      get :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end

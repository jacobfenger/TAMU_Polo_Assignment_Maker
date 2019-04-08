require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  # describe "test_create" do
  #   it "should login with correct password" do
  #     get :create,  :password => {:password => 'polo'}
  #     expect(response).to redirect_to(root_path)
  #     # expect to be logged in **
  #   end
    
  #   it "should not login with incorrect password" do
  #     get :create, :password => {:password => 'wrong'}
  #     expect(flash[:notice]).to eq("Incorrect password entered.")
  #     # redirect to somewhere **
  #     # expect to not be logged in **
  #   end
    
  # end
  
  describe "test_destroy" do
    it "should logout and go to home page" do
      get :destroy
      expect(response).to redirect_to(root_path)
      # expect to not be logged in **
    end
  end

end

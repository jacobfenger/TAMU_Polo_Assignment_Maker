require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
        context "create user with correct input" do
            it "saves user to database" do
                post :create, user: FactoryGirl.attributes_for(:user)
                expect(User.count).to eq(1)
            end
            it "redirects to the home page" do
              post :create, user: FactoryGirl.attributes_for(:user)
              expect(response).to redirect_to(root_path)
            end
            
        end
    end

end

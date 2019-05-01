require 'rails_helper'

RSpec.describe PracticesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "test_create" do
    it 'should create valid practice' do
        get :create, :p => {:time => DateTime.current, :date => Date.new(2007, 5, 12), :summary => "real practice"}
        expect(flash[:notice]).to eq("Successfully created a practice")
        expect(response).to redirect_to(practices_path)
    end
    
    it 'should display error for invalid practice' do
        get :create, :p => {:time => ''}
        expect(flash[:notice]).to eq("There was an error in practice creation.")
    end
    
  end
  
  describe "test_save" do
    it 'should save valid practice' do
        get :create, :p => {:time => DateTime.current, :date => Date.new(2007, 5, 12), :summary => "real practice"}
        get :save, :p => {:time => DateTime.current, :date => Date.new(2007, 5, 12), :summary => "edited practice"}, :format => 2
        expect(flash[:notice]).to eq("Edit successfully.")
        expect(response).to redirect_to(practices_path)
    end
    
    it 'should display error for invalid practice' do
        get :create, :p => {:time => DateTime.current, :date => Date.new(2007, 5, 12), :summary => "real practice"}
        get :save, :p => {:bad => "bad"}, :format => 3
        expect(flash[:notice]).to eq("There was an error in editing the practice.")
    end
    
  end
  
 describe "test_delete" do
    it 'should delete practice' do
        get :create, :p => {:time => DateTime.current, :date => Date.new(2007, 5, 12), :summary => "real practice"}
        post :delete, :format => "4" # hack, need to figure out real format
        expect(Practice.count).to eq(0)
        expect(response).to redirect_to(practices_path)
    end
    
  end

end

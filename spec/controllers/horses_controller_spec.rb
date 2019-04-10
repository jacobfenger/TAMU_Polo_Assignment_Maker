require 'rails_helper'

RSpec.describe HorsesController, type: :controller do
    
    describe "test_create" do
        it 'should save valid horse' do
            get :create, :horse => {:name => 'name',:age => '1'}
            expect(response).to redirect_to(horses_path)
        end
        
        it 'should display error for invalid horse' do
            get :create, :horse => {:name => 'name'}
            expect(flash[:notice]).to eq("Horse was not saved successfully")
            expect(response).to redirect_to(horses_path)
        end
        
    end
    
    describe "test_save" do
        it 'should save horse info' do
            post :create, :horse => {:name => 'name', :age =>'0'}
            post :save, :horse => {:name => 'name', :age =>'0'}, :format => "2" # hack, need to figure out real format
            expect(response).to redirect_to(horses_path)
        end
        
    end
    
     describe "test_delete" do
        it 'should delete horse' do
            post :create, :horse => {:name => 'name', :age =>'0'}
            post :delete, :format => "3" # hack, need to figure out real format
            expect(Horse.count).to eq(0)
            expect(response).to redirect_to(horses_path)
        end
        
     end
end

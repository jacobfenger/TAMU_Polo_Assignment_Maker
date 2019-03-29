require 'rails_helper'

RSpec.describe HorsesController, type: :controller do
    
    describe "test_create" do
        it 'should save valid horse' do
            get :create, :horse => {:name => 'name',:age => '1'}
            expect(response).to redirect_to(horses_path)
        end
        
        it 'should display error for invalid horse' do
            get :create, :horse => {:name => 'name'}
            expect(flash[:error]).to eq("Both name and age are required.")
            expect(response).to redirect_to(horses_path)
        end
    end

end

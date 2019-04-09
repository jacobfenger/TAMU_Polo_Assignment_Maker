require 'rails_helper'



RSpec.describe User, type: :model do
    
  describe 'requirements' do
      context 'password' do
          it 'does not allow passwords less than 6 characters' do
              expect{FactoryGirl.create(:user, first_name: 'Bob', last_name: 'Smith', email: 'blah75690@blah.com', phone: '1234567890', password: 'test', password_confirmation: 'test')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password is too short (minimum is 6 characters)")
          end
          it 'allows passwords more than 6 characters' do
              expect{FactoryGirl.create(:user, first_name: 'Bob', last_name: 'Smith', email: 'blah75690@blah.com', phone: '1234567890', password: 'test123', password_confirmation: 'test123')}.not_to raise_error
          end
          it 'does not allow non matching confirmation passwords' do
              expect{FactoryGirl.create(:user, first_name: 'Bob', last_name: 'Smith', email: 'blah7569@blah.com', phone: '1234567890', password: 'test456', password_confirmation: 'test123')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password confirmation doesn't match Password")
          end
      end
      context 'email' do
          it 'does not allow emails without @ symbol' do
              expect{FactoryGirl.create(:user, first_name: 'Bob', last_name: 'Smith', email: 'blah75690blah.com', phone: '1234567890', password: 'test123', password_confirmation: 'test123')}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email is invalid")
          end
          it 'allows emails with @ symbol' do
              expect{FactoryGirl.create(:user, first_name: 'Bob', last_name: 'Smith', email: 'blah75690@blah.com', phone: '1234567890', password: 'test123', password_confirmation: 'test123')}.not_to raise_error
          end
      end
      
      end
  end


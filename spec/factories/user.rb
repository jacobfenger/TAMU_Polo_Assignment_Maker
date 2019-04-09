FactoryGirl.define do
  factory :user do
    first_name 'fname'
    last_name 'lname'
    email 'fl@blah.com'
    phone '1234567890'
    password 'password'
    password_confirmation 'password'
  end
end

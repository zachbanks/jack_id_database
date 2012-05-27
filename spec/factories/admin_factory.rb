FactoryGirl.define do
  factory :admin do
    sequence(:username) { |n| "admin#{n}" }
    password 'password'
  end
end
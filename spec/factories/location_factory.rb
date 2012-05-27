FactoryGirl.define do
  factory :location do
    association :building
    sequence(:room) { |n| "320-#{n}" }
    notes 'These are some internal notes about the location.'
  end
end
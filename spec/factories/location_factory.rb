FactoryGirl.define do
  factory :location do
    association :building
    sequence(:room) { |n| "320-#{n}" }
    notes 'These are some internal notes about the location.'
    
    factory :location_with_jack_ids do
      ignore { jack_id_count 5 }
      after(:create) do |location, evaluator|
        create_list(:jack_id, evaluator.jack_id_count, :location => location)
      end
    end    
  end
end
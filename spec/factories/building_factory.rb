FactoryGirl.define do
  factory :building do
    sequence(:name)  { |n| "Building#{n}" }
    short_name { generate_random_string(3) }
    
    # For has many associations documentation see: https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
    # after(:create) yields building object and evaluator that contains all values from the factory.
    factory :building_with_locations do
      ignore { locations_count 5 }
      after(:create) do |building, evaluator|
        create_list(:location, evaluator.locations_count, :building => building)
      end
    end
  end
end
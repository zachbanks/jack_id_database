FactoryGirl.define do
  factory :jack_id do
    association :location
    label 'bow-02-03-123'
    connections 'A: Phone B: Ethernet'
  end
end
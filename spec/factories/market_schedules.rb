FactoryGirl.define do
  factory :market_schedule do
    association :market
    association :season
    association :schedule
  end
end

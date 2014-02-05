# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :season do
    season_number 1
    start_month "January"
    end_month "July"
  end
end

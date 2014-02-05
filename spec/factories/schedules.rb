# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    day 1
    start_time "13:00:00"
    end_time "18:00:00"
  end
end

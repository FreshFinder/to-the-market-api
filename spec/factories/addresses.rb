# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "943 Main Street"
    city "Akron"
    state "Ohio"
    zipcode 44303
    lat 41.073104
    long -81.517800
    description "The parking lot"
  end
end

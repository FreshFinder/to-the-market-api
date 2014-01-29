FactoryGirl.define do
  factory :offering do
    association :market
    association :product
  end
end

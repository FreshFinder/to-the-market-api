FactoryGirl.define do
  factory :accepted_payment do
    association :market
    association :payment_type
  end
end

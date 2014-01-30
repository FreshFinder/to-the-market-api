class AcceptedPayment < ActiveRecord::Base
  belongs_to :market
  belongs_to :payment_type
end

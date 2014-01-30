class PaymentType < ActiveRecord::Base
  has_many :accepted_payments
  has_many :markets, through: :accepted_payments
end

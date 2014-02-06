class PaymentType < ActiveRecord::Base
  validates_presence_of :name

  has_many :accepted_payments
  has_many :markets, through: :accepted_payments
end

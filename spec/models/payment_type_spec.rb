require 'spec_helper'

describe PaymentType do
  describe "with valid parameters" do
    it "creates a payment type" do
      FactoryGirl.build(:payment_type).should be_valid
    end
  end

  describe "with invalid parameters" do
    it "is missing name" do
      FactoryGirl.build(:payment_type, :name => nil).should be_valid
    end
  end
end

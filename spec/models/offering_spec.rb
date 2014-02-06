require 'spec_helper'

describe Offering do
  describe "product association" do
    it "should have products" do
      pending
      @product = FactoryGirl.build(:product)
      expect(@offering.product.first.name).to eq("honey")
    end
  end
end

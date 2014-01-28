require 'spec_helper'

describe Address do
  describe "with valid params" do
    it "creates an address" do
       FactoryGirl.build(:address).should be_valid
    end
  end

  describe "with invalid params" do
    it "is missing market id" do
      FactoryGirl.build(:address, :market_id => nil).should_not be_valid
    end

    it "is missing latitude" do
      FactoryGirl.build(:address, :lat => nil).should_not be_valid
    end

    it "is missing longitude" do
      FactoryGirl.build(:address, :long => nil).should_not be_valid
    end

  end
end

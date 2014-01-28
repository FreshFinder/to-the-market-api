require 'spec_helper'

describe Address do
  describe "with valid params" do
    it "creates an address" do
       FactoryGirl.build(:address).should be_valid
    end
  end
end

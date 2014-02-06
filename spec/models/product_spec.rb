require 'spec_helper'

describe Product do
  describe "with valid params" do
    it "creates a product" do
      FactoryGirl.build(:product).should be_valid
    end
  end

  describe "with invalid params" do
    it "is missing name" do
      FactoryGirl.build(:product, :name => nil).should be_valid
    end
  end
end

require 'spec_helper'
require 'stringio'
require './db/seeds/product_seeder'

describe ProductSeeder do
  it "changes the count of Products in the database" do
    out = StringIO.new
    expect(Product.count).to eq 0
    ProductSeeder.seed(out)
    expect(Product.count).to eq 20
  end
end

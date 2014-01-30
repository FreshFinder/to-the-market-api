require 'spec_helper'
require 'stringio'
require './db/seeds/payment_type_seeder'

describe PaymentTypeSeeder do
  it "changes the count of Payment Types in the database" do
    out = StringIO.new
    expect(PaymentType.count).to eq 0
    PaymentTypeSeeder.seed(out)
    expect(PaymentType.count).to eq 5
  end
end

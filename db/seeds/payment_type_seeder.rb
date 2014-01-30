class PaymentTypeSeeder
  def self.seed(out = STDOUT)
    PaymentType.create!(:name => "credit")
    PaymentType.create!(:name => "wic")
    PaymentType.create!(:name => "wiccash")
    PaymentType.create!(:name => "sfmnp")
    PaymentType.create!(:name => "snap")
  end
end

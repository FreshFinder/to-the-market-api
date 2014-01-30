class CreateAcceptedPayments < ActiveRecord::Migration
  def change
    create_table :accepted_payments do |t|
      t.integer :market_id
      t.integer :payment_type_id
      t.timestamps
    end
  end
end

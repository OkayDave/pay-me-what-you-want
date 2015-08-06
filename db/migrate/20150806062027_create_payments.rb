class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_token
      t.string :payer
      t.integer :value
      t.string :stripe_charge_id

      t.timestamps null: false
    end
  end
end

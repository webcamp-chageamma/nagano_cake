class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :destination_postal_code
      t.string :destination_address
      t.string :destination_name
      t.integer :payment
      t.integer :sub_total
      t.integer :freight
      t.integer :total_due
      t.integer :order_status

      t.timestamps
    end
  end
end

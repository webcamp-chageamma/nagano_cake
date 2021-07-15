class CreateOrderCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :order_commodities do |t|
      t.integer :order_id
      t.integer :commodity_id
      t.integer :price
      t.integer :quantity
      t.integer :commodity_status

      t.timestamps
    end
  end
end

class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.integer :genre_id
      t.string :name
      t.text :opinion
      t.integer :non_taxed_price
      t.string :image_id
      t.integer :sale_status, default: 0

      t.timestamps
    end
  end
end

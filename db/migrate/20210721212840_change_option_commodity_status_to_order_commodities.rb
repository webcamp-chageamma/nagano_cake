class ChangeOptionCommodityStatusToOrderCommodities < ActiveRecord::Migration[5.2]
  def change
    change_column :order_commodities, :commodity_status, :integer, default: 0
  end
end

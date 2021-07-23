class Admin::OrderCommoditiesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_commodity = OrderCommodity.find(params[:id])
    @order = @order_commodity.order
    @order_commodity.update(order_commodity_params)

    if @order_commodity.commodity_status == "制作中"
      @order.update(order_status: 2)
    elsif @order.order_commodities.count == @order.order_commodities.where(commodity_status: "製作完了").count
      @order.update(order_status: 3)
    end

    @order_commodities = @order.order_commodities
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_commodity_params
    params.require(:order_commodity).permit(:commodity_status)
  end
end

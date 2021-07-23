class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    case params[:order_sort]
    when "0"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).per(8).reverse_order
    else
      @orders = Order.page(params[:page]).per(8).reverse_order
    end

  end

  def show
    @order = Order.find(params[:id])
    @order_commodities = @order.order_commodities
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order_commodities = @order.order_commodities.update(commodity_status: 1)
    end
    redirect_to admin_order_path(@order.id)
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end

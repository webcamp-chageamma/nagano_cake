class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    @destinations = Destination.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order = Order.new(
      customer_id: current_customer.id,
      payment: params[:order] [:payment]
    )
    if params[:order] [:destination] == "current_address"
      @order.destination_postal_code = current_customer.postal_code
      @order.destination_address = current_customer.address
      @order.destination_name = current_customer.name
    elsif params[:order] [:destination] == "registered_address"
      d = Destination.find(params[:order][:destination_id])
      @order.destination_postal_code = d.postal_code
      @order.destination_address = d.place
      @order.destination_name = d.name
    elsif params[:order] [:destination] == "new_address"
      @order.destination_postal_code = params[:order][:destination_postal_code]
      @order.destination_address = params[:order][:destination_address]
      @order.destination_name = params[:order][:destination_name]
    else
      @destinations = Destination.where(customer_id: current_customer.id)
      render :new
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
        OrderCommodity.new(
          order_id: @order.id,
          commodity_id: cart_item.commodity_id,
          price: cart_item.commodity.add_tax_sales_price,
          quantity: cart_item.quantity
        ).save
      end
      current_customer.cart_items.destroy_all
      redirect_to thanks_path
    else
      @cart_items = current_customer.cart_items.all
      @destinations = Destination.where(customer_id: current_customer.id)
      render :new
    end
  end

  def thanks
    @commodities = Commodity.order(created_at: :DESC).page(params[:page]).per(4)
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(8).reverse_order
    @order_commodities = OrderCommodity.where(customer_id: current_customer.id)
  end

  def show
    if params[:id] === "confirm"
      return redirect_to  new_order_path
    end
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:destination_postal_code, :destination_address, :destination_name, :payment, :sub_total, :freight, :total_due)
  end

  def new_address_params
    params.permit(:destination_postal_code, :destination_address, :destination_name)
  end
end

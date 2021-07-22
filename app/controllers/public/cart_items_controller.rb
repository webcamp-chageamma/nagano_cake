class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    
    @cart_item = current_customer.cart_items.new(cart_item_params)
    
    if cart_item = current_customer.cart_items.find_by(commodity_id: params[:cart_item][:commodity_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      flash[:notice] = "Item was successfully added to cart."
      redirect_to cart_items_path

    elsif @cart_item.save
      flash[:notice] = "New Item was successfully added to cart."
      redirect_to cart_items_path

    else
      render cart_items_path
    end

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :commodity_id)
  end

end
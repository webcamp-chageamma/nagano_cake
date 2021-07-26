class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    if params[:cart_item][:quantity].empty?
      flash[:alert] = '値を入力してください。'
     return redirect_to commodity_path(params[:cart_item][:commodity_id])
    end

    if cart_item = current_customer.cart_items.find_by(commodity_id: params[:cart_item][:commodity_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      flash[:alert] ="登録されている商品を追加しました。"
      redirect_to cart_items_path
    else @cart_item.save
      flash[:alert] = "新しい商品をカートに入れました。"
      redirect_to cart_items_path
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
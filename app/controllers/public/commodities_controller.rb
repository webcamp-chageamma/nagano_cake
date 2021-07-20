class Public::CommoditiesController < ApplicationController

  def index
    @commodities = Commodity.all
  end

  def show
    @commodity = Commodity.find(params[:id])
    @cart_item = CartItem.new
  end
  
end

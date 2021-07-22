class Public::CommoditiesController < ApplicationController

  def index
    @commodities = Commodity.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @commodity = Commodity.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end


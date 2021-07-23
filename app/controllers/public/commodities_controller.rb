class Public::CommoditiesController < ApplicationController
s
  before_action :correct_commodities, only: [:show]

  def index
    @commodities = Commodity.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @commodity = Commodity.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def correct_commodities
    @commodity = Commodity.find(params[:id])
    unless @commodity.sale_status == "販売中"
      redirect_to commodities_path
    end
  end

end
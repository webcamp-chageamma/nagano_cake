class Admin::CommoditiesController < ApplicationController

  def new
    @commodity = Commodity.new
  end

  def create
    @commodity = Commodity.new(commodity_params)
    #テストデータ　ジャンルidを指定して保存する
    @commodity.genre_id = 1
    if @commodity.save!
      redirect_to admin_commodities_path
    else
     render :new
    end

  end

  def index
    @commodities = Commodity.all
    puts @commodities
  end

  def show
    @commodity = Commodity.find(params[:id])
  end

  def edit
    @commodity = Commodity.find(params[:id])
  end

  def update
    commodity = Commodity.find(params[:id])
    commodity.update(commodity_params)
    redirect_to commodity_path(commodity.id)
  end

  private
  def commodity_params
    params.require(:commodity).permit(:image, :name, :opinion, :non_taxed_price, :sale_status)
  end

end


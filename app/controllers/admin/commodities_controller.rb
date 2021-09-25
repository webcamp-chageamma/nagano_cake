class Admin::CommoditiesController < ApplicationController

  before_action :authenticate_admin!

  def new
    @commodity = Commodity.new
  end

  def create
    @commodity = Commodity.new(commodity_params)
    if @commodity.save
      flash[:notice] = "新規登録が完了しました。"
      redirect_to admin_commodity_path(@commodity)
    else
     render :new
    end

  end

  def index
    @commodities = Commodity.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def show
    @commodity = Commodity.find(params[:id])
  end

  def edit
    @commodity = Commodity.find(params[:id])
  end

  def update
    @commodity = Commodity.find(params[:id])
    if @commodity.update(commodity_params)
      flash[:notice] = "商品を更新しました。"
      redirect_to admin_commodity_path(@commodity)
    else
      render "edit"
    end
  end

  private
  def commodity_params
    params.require(:commodity).permit(:image, :name, :opinion, :non_taxed_price, :sale_status ,:genre_id)
  end

end


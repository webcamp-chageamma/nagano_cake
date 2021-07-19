class Public::HomesController < ApplicationController
  def top
    @commodities = Commodity.order(created_at: :DESC).page(params[:page]).per(4)
  end

  def about
  end
end

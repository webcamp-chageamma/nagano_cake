class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @commodities = Commodity.order(created_at: :DESC).page(params[:page]).per(4)
  end

  def about
  end
  
end

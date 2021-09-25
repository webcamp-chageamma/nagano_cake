class Public::SearchesController < ApplicationController
  def search
    if params[:content].nil?
      @value = params["search"]["value"]
      @commodities = Commodity.search_genre_for(@value).page(params[:page]).per(8)
      @genres = Genre.all
      @commodity_count = Commodity.search_genre_for(@value).count
    else
      @content = params[:content]
  	  @commodities = Commodity.search_for(@content).page(params[:page]).per(8)
  	  @genres = Genre.all
  	  @commodity_count = Commodity.search_for(@content).count
    end
  end

end

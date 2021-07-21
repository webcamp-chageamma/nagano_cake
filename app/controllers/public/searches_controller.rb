class Public::SearchesController < ApplicationController
  def search
    if params[:content].nil? 
      @value = params["search"]["value"]
      @commodities = Commodity.search_genre_for(@value)
    else 
      @content = params[:content]
  	  @commodities = Commodity.search_for(@content)
    end
  end
  
end

class Public::SearchesController < ApplicationController
  def search
	@commodities = Commodity.search_for(params[:content])
    @content = params[:content]
  end
end

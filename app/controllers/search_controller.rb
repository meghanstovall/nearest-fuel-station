class SearchController < ApplicationController
  def index
    @search_facade = SearchFacade.new(params[:location])
  end
end

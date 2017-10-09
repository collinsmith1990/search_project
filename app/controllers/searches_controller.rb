class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
  end

  def create
    search_term = SearchTerm.find_or_create_by(content: params[:content])
    @search = search_term.searches.create
  end
end

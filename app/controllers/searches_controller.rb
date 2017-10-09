class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
    @gifs = Giphy.new.search(@search.search_term.content)
  end

  def create
    search_term = SearchTerm.find_or_create_by(content: params[:content])
    @search = search_term.searches.create
    redirect_to search_path(@search)
  end
end

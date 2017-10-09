class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
    @gifs = Giphy.new.search(@search.search_term.content)
    if @gifs.empty?
      flash.now[:danger] = 'No Gifs Found'
    end
  rescue ActiveRecord::RecordNotFound
    flash.now[:danger] = 'Search id not found'
    redirect_to search_terms_path
  end

  def create
    search_term = SearchTerm.find_or_create_by!(content: params[:content])
    @search = search_term.searches.create
    redirect_to search_path(@search)
  rescue ActiveRecord::RecordInvalid => e
    flash[:danger] = e.to_s
    redirect_to search_terms_path
  end
end

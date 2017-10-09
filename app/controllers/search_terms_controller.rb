class SearchTermsController < ApplicationController
  def index
    @search_terms = SearchTerm.sort_by(params[:order]).paginate(page: params[:page], per_page: 30)
  end
end

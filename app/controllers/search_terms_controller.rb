class SearchTermsController < ApplicationController
  def index
    @search_terms = SearchTerm.sort_by(params[:order])
  end
end

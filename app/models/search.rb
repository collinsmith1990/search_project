class Search < ApplicationRecord
  belongs_to :search_term

  def self.new_with_search_term(content)
    search_term = SearchTerm.find_or_create_by(content: content.downcase)
    Search.new(search_term: search_term)
  end
end

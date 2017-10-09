class SearchTerm < ApplicationRecord
  validates :content, presence: true, allow_blank: false, :uniqueness => { :case_sensitive => false } 

  scope :by_terms, -> { order(:content) }
  scope :by_date, -> { order('updated_at DESC') }

  def content=(val)
    write_attribute(:content, val.downcase)
  end

  def self.sort_by(params)
    case params
    when 'date'
      SearchTerm.by_date
    when 'terms'
      SearchTerm.by_terms
    else
      SearchTerm.by_date
    end
  end
end

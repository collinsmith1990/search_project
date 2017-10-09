class SearchTerm < ApplicationRecord
  has_many :searches, dependent: :destroy

  validates :content, presence: true, allow_blank: false, :uniqueness => { :case_sensitive => false } 

  before_save :downcase_content

  scope :by_terms, -> { order(:content) }
  scope :by_date, -> { order('updated_at DESC') }
  scope :by_count, -> { select('search_terms.*').joins(:searches).group(:id).order('count(search_terms.id) desc') }

  def self.sort_by(params)
    case params
    when 'date'
      SearchTerm.by_date
    when 'terms'
      SearchTerm.by_terms
    when 'count'
      SearchTerm.by_count
    else
      SearchTerm.by_date
    end
  end

  private
  def downcase_content
    self.content = self.content.downcase
  end
end

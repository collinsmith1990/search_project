require 'rails_helper'

RSpec.describe SearchTerm, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:search_term)).to be_valid
  end

  it 'is not valid with blank content' do
    expect(build(:search_term, content: '')).not_to be_valid
  end

  it 'is not valid if not unique' do
    create(:search_term, content: 'test')
    expect(build(:search_term, content: 'test')).not_to be_valid
  end

  describe 'by_date' do
    it 'orders by updated_at' do
      search_terms = [
        create(:search_term, updated_at: Time.now + 10.minutes),
        create(:search_term, updated_at: Time.now + 5.minutes),
        create(:search_term, updated_at: Time.now)
      ]

      expect(SearchTerm.by_date).to eq(search_terms)
    end
  end

  describe 'by_terms' do
    it 'orders by terms' do
      search_terms = [
        create(:search_term, content: 'Apple'),
        create(:search_term, content: 'Bat'),
        create(:search_term, content: 'Car')
      ]

      expect(SearchTerm.by_terms).to eq(search_terms)
    end
  end

  describe 'sort_by' do
    context 'date' do
      it 'orders by updated_at' do
        search_terms = [
          create(:search_term, updated_at: Time.now + 10.minutes),
          create(:search_term, updated_at: Time.now + 5.minutes),
          create(:search_term, updated_at: Time.now)
        ]

        expect(SearchTerm.by_date).to eq(search_terms)
      end
    end

    context 'terms' do
      it 'orders by terms' do
        search_terms = [
          create(:search_term, content: 'Apple'),
          create(:search_term, content: 'Bat'),
          create(:search_term, content: 'Car')
        ]

        expect(SearchTerm.by_terms).to eq(search_terms)
      end
    end
  end
end

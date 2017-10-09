require 'rails_helper'

RSpec.describe SearchTermsController, type: :controller do

  describe "GET #index" do
    it "assigns @search_items" do
      search_term = create(:search_term)
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:search_terms)).to eq([search_term])
    end

    describe 'order' do
      context 'date' do
        it 'assigns @search_iterms ordered by date' do
          search_terms = [
            create(:search_term, updated_at: Time.now + 10.minutes),
            create(:search_term, updated_at: Time.now + 5.minutes),
            create(:search_term, updated_at: Time.now)
          ]

          get :index, params: { :order => 'date' }
          expect(response).to have_http_status(:success)
          expect(assigns(:search_terms)).to eq(search_terms)
        end
      end

      context 'terms' do
        it 'assigns @search_iterms ordered by terms' do
          search_terms = [
            create(:search_term, content: 'Apple'),
            create(:search_term, content: 'Bat'),
            create(:search_term, content: 'Car')
          ]
          get :index, params: { :order => 'terms' }
          expect(response).to have_http_status(:success)
          expect(assigns(:search_terms)).to eq(search_terms)
        end
      end
    end
  end

end

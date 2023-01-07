require 'rails_helper'

RSpec.describe "Schools", type: :request do
  let!(:schools) { create_list(:school, 10) }
  let(:school_id) { schools.first.id }

  # Test suite for GET /schools
  describe 'GET /schools' do
    # make HTTP get request before each example
    before { get '/schools' }

    it 'returns schools' do
      # Note `json` is a custom helper to parse JSON responses
      expect(JSON.parse(response.body)).not_to be_empty 
      expect(JSON.parse(response.body).count).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /schools/:id
  describe 'GET /schools/:id' do
    before { get "/schools/#{school_id}" }

    context 'when the record exists' do
      it 'returns the school' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)["id"]).to eq(school_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end

  # Test suite for POST /school
  describe 'POST /schools' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm'} }

    context 'when the request is valid' do
      before { post '/schools', params: valid_attributes }

      it 'creates a schools' do
        expect(JSON.parse(response.body)['name']).to eq('Learn Elm')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for PUT /schools/:id
  describe 'PUT /schools/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/schools/#{school_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /schools/:id
  describe 'DELETE /schools/:id' do
    before { delete "/schools/#{school_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

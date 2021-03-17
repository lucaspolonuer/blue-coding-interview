require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe '/create' do
    let(:params) { {} }
    before do
      post :create, params: params
    end

    context 'with an empty url' do
      it 'responds with a 400 bad request' do
        expect(response).to have_http_status :bad_request
      end
    end

    context 'with an invalid url param' do
      let(:params) { { large_url: 'invalid' } }

      it 'responds with a 400 bad request' do
        expect(response).to have_http_status :bad_request
      end
    end

    context 'with a valid url' do
      let(:params) { { large_url: 'https://google.com' } }

      let(:expected_response) do
        {
            id: 1,
            large_url: 'https://google.com'
        }.stringify_keys
      end

      let(:expected_short_url) { "/w/b" }

      it 'responds with a 201 created' do
        expect(response).to have_http_status :created
      end

      it 'responds with the generated url' do
        expect(response.parsed_body).to include(expected_response)
      end

      it 'responds with the correct shortened url' do
        expect(response.parsed_body['shortened_url']).to eq expected_short_url
      end
    end
  end
end
require 'rails_helper'

describe "Url decode" do
  let(:original_url) { 'https://google.com' }

  before do
    Url.create(id: 1, large_url: original_url)
  end

  it "Decodes the encoded_url and redirects to the original url" do
    get "/w/b"
    expect(response).to redirect_to(original_url)
  end

  context 'when there is no url with that hash' do

    it "renders a 404 not found" do
      get "/w/c"
      expect(response).to have_http_status :not_found
    end
  end
end

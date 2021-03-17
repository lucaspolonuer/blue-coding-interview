require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is not valid without a large_url' do
    url = Url.create
    expect(url).not_to be_valid
  end

  it 'is not valid with an invalid large_url' do
    url = Url.create(large_url: 'invalid-url')
    expect(url).not_to be_valid
  end

  it 'is valid with required fields' do
    url = Url.create(large_url: 'https://google.com')
    expect(url).to be_valid
  end
end

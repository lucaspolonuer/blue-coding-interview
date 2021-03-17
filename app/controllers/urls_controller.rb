class UrlsController < ApplicationController
  def create
    @url = Url.create(large_url: large_url)
    return render status: :bad_request unless @url.valid?

    render status: :created, json: serialized_url
  end

  def decode
    redirect_to original_url
  end

  private

  def shortened_url
    IdEncoder.bijective_encode(@url.id)
  end

  def original_url
    id = IdEncoder.bijective_decode(params[:encoded_url])
    Url.find(id).large_url
  end

  def serialized_url
    @url.attributes.merge(shortened_url: "/w/#{shortened_url}")
  end

  def large_url
    params.require(:large_url)
  end
end

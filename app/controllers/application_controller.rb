# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do |error|
    render status: :bad_request, json: error
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render status: :not_found, json: error
  end
end

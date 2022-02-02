# frozen_string_literal: true

require 'faraday'
require 'faraday/retry'

module Companies
  class Client
    def connection
      @connection ||= Faraday.new(Rails.application.credentials.companies_api.base_url) do |f|
        f.request :json
        f.request :retry
        f.request :authorization, :basic, Rails.application.credentials.companies_api.api_key, ''

        f.response :json

        f.adapter :net_http
      end
    end
  end
end

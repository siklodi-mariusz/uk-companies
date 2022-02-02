# frozen_string_literal: true

module Companies
  class Api
    attr_reader :connection

    def initialize(client = Client.new)
      @connection = client.connection
    end

    def search(params)
      connection.get('/search/companies', params).body['items']
    end
  end
end

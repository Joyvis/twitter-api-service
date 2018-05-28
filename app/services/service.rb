# frozen_string_literal: true

class Service
  class << self
    def get(url:, headers:)
      RestClient.get(url, headers) { |response| JSON.parse response }
    end
  end
end

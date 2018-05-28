# frozen_string_literal: true

class TweepsService < Service
  class << self
    URL_BASE = ENV['TWEEPS_SERVICE'].to_s

    def most_mentions_tweets
      binding.pry
      query = { params: { q: 'locaweb' } }
      get(url: "#{URL_BASE}/most_mentions", headers: default_header.merge(query))
    end

    private_class_method

    def default_header
      { 'Username' => ENV['HTTP_USERNAME'] }
    end
  end
end

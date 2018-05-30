# frozen_string_literal: true

class TweepsService < Service
  class << self
    URL_BASE = ENV['TWEEPS_SERVICE'].to_s
    SEARCHED_USER_ID = ENV['TWEEPS_SEARCH_USER_ID'].to_i

    def search_tweets_by_screen_name(screen_name)
      tweets = get(url: "#{URL_BASE}/search/tweets.json?q=%40#{screen_name}",
                   headers: default_header)['statuses']
      # Mesmo passando parametros a API retorna tweets sem a menção
      # Filtro manual para listar somente os tweets que fazem menção
      binding.pry
      filter_tweets tweets
    end

    private_class_method

    def default_header
      { 'Username' => ENV['HTTP_USERNAME'] }
    end

    def filter_tweets(tweets)
      tweets.reject do |tweet|
        !mention_list(tweet).include? SEARCHED_USER_ID
      end
    end

    def mention_list(tweet)
      tweet['entities']['user_mentions'].map { |mention| mention['id'] }
    end
  end
end

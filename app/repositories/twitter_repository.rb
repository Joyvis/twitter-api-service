# frozen_string_literal: true

class TwitterRepository
  class << self
    def list_tweets(screen_name:)
      tweets = TwitterService.search_tweets_by_screen_name screen_name
      tweets.map do |tweet|
        TwitterEntity.new filter_tweets_attr(tweet)
      end
    end

    private_class_method

    def filter_tweets_attr(tweet)
      { screen_name: tweet['user']['screen_name'],
        followers_count: tweet['user']['followers_count'],
        retweet_count: tweet['retweet_count'],
        favorite_count: tweet['favorite_count'],
        text: tweet['text'],
        created_at: tweet['created_at'],
        profile_link: profile_link(tweet),
        link: link(tweet),
        in_reply_to_user_id: tweet['in_reply_to_user_id'] }
    end

    def profile_link(tweet)
      "https://twitter.com/#{tweet['user']['screen_name']}"
    end

    def link(tweet)
      "#{profile_link(tweet)}/status/#{tweet['id_str']}"
    end
  end
end

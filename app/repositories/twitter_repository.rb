# frozen_string_literal: true

class TwitterRepository
  class << self
    def list_tweets(screen_name:)
      tweets = TwitterService.search_tweets_by_screen_name screen_name
      tweets.map do |tweet|
        TweetEntity.new filter_tweets_attr(tweet)
      end
    end

    def list_tweets_by_user(screen_name:)
      tweets = TwitterService.search_tweets_by_screen_name(screen_name)
      tweets_user = filter_tweets_user_attr tweets
      tweets_user.keys.map do |key|
        UserTweetEntity.new(screen_name: key, tweets: tweets_user[key])
      end
    end

    private_class_method

    def filter_tweets_user_attr(tweets)
      tweets_by_user = {}
      tweets.each do |tweet|
        twitter_entity = TweetEntity.new filter_tweets_attr(tweet)
        unless tweets_by_user[twitter_entity.screen_name].present?
          tweets_by_user[twitter_entity.screen_name] = []
        end
        tweets_by_user[twitter_entity.screen_name] << twitter_entity
      end
      tweets_by_user
    end


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

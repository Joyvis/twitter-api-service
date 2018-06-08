# frozen_string_literal: true

class FilterTweetsByUser < TweetRules
  attr_reader :user_tweets

  def self.list
    new.list
  end

  def initialize
    @user_tweets = TwitterRepository.
      list_tweets_by_user(screen_name: SCREEN_NAME_SEARCHED)
  end

  def list
    user_tweets.map do |user_tweet|
      user_tweet.tweets = remove_in_reply user_tweet.tweets
      user_tweet.tweets = order_tweets user_tweet.tweets

      user_tweet
    end
  end
end

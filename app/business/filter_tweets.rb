# frozen_string_literal: true

class FilterTweets
  attr_reader :tweets

  SCREEN_NAME_SEARCHED = ENV['TWEEPS_SEARCH_SCREEN_NAME'].to_s
  USER_ID_SEARCHED = ENV['TWEEPS_SEARCH_USER_ID'].to_i

  def self.list
    new.list
  end

  def initialize
    @tweets = TweepsRepository.list_tweets(screen_name: SCREEN_NAME_SEARCHED)
  end

  def list
    remove_in_reply
    order_tweets
  end

  private

  def remove_in_reply
    @tweets.reject! { |tweet| tweet.in_reply_to_user_id == USER_ID_SEARCHED }
  end

  def order_tweets
    @tweets.sort_by! do|tweet|
      [tweet.followers_count, tweet.retweet_count, tweet.favorite_count]
    end.reverse
  end
end

# frozen_string_literal: true

class FilterTweets < TweetRules
  attr_reader :tweets

  def self.list
    new.list
  end

  def initialize
    @tweets = TwitterRepository.list_tweets(screen_name: SCREEN_NAME_SEARCHED)
  end

  def list
    order_tweets(remove_in_reply(tweets))
  end
end

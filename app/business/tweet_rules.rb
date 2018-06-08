class TweetRules
  SCREEN_NAME_SEARCHED = ENV['TWITTER_SEARCH_SCREEN_NAME'].to_s
  USER_ID_SEARCHED = ENV['TWITTER_SEARCH_USER_ID'].to_i

  def remove_in_reply(tweets)
    tweets.reject { |tweet| tweet.in_reply_to_user_id == USER_ID_SEARCHED }
  end

  def order_tweets(tweets)
    tweets.sort_by do|tweet|
      [tweet.followers_count, tweet.retweet_count, tweet.favorite_count]
    end.reverse
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :tweet_entity do
    screen_name 'teste'
    followers_count 10
    retweet_count 11
    favorite_count 12
    text 'tweet test @locaweb'
    created_at 'Mon Sep 24 03:35:21 +0000 2012'
    profile_link 'http://www.twitter.com/teste'
    link 'http://www.twitter.com/teste/status/123123'
    in_reply_to_user_id 22

    initialize_with do
      new(attributes)
    end
  end
end

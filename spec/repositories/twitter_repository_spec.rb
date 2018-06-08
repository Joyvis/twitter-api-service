# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterRepository do
  before do
    allow(TwitterService).
      to receive(:search_tweets_by_screen_name).and_return(tweets)
  end

  let(:screen_name){ ENV['TWITTER_SEARCH_SCREEN_NAME'] }
  let(:tweet) do
    { 'user' => { 'screen_name' => 'teste', 'followers_count' => 10 },
      'retweet_count' => 9, 'favorite_count' => 8 , 'text' => 'aa @locaweb',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 22 }
  end

  describe '.list_tweets' do
    let(:tweets) { [tweet, tweet, tweet] }
    subject { described_class.list_tweets screen_name: screen_name }

    context 'with tweets of same user' do
      it 'tweets listed' do
        expect(subject.size).to eq 3
        expect(subject.first).to be_a TweetEntity
      end
    end
  end

  describe '.list_tweets_by_user' do
    let(:tweets) { [tweet.merge({ 'user' => { 'screen_name' => 'teste2'} }),
                    tweet, tweet] }
    subject { described_class.list_tweets_by_user screen_name: screen_name }

    context 'with tweets of different users' do
      it 'tweets grouped by users' do
        expect(subject.size).to eq 2
        expect(subject.first).to be_a UserTweetEntity
        expect(subject.last.tweets.size).to eq 2
      end
    end
  end
end

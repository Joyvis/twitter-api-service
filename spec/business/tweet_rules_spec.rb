# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetRules, type: :business do
  before do
    allow(TwitterRepository).to receive(:list_tweets).and_return(tweets)
  end

  let(:tweets) { build_list(:tweet_entity, 4) }
  let(:attributes_entity) { attributes_for(:tweet_entity) }

  describe '.order_tweets' do
    subject { described_class.new.order_tweets tweets }

    context 'tweets ordered by followers count' do
      before do
        tweets << build(:tweet_entity, followers_count: 999)
      end

      it_behaves_like 'is expected to be', TweetEntity
      it { expect(subject.first.followers_count).to eq 999 }
    end

    context 'tweets ordered by followers and retweets count' do
      before do
        tweets << build(:tweet_entity, followers_count: 999, retweet_count: 998)
        tweets << build(:tweet_entity, followers_count: 999)
      end

      it_behaves_like 'is expected to be', TweetEntity
      it { expect(subject.first.followers_count).to eq 999 }
      it { expect(subject.first.retweet_count).to eq 998 }
    end

    context 'tweets ordered by followers, favorites and retweets count' do
      before do
        tweets << build(:tweet_entity, followers_count: 999,
          retweet_count: 998, favorite_count: 997)
        tweets << build(:tweet_entity, followers_count: 999, retweet_count: 998)
        tweets << build(:tweet_entity, followers_count: 999)
      end

      it_behaves_like 'is expected to be', TweetEntity
      it { expect(subject.first.followers_count).to eq 999 }
      it { expect(subject.first.retweet_count).to eq 998 }
      it { expect(subject.first.favorite_count).to eq 997 }
    end
  end

  describe '.remove_in_reply' do
    subject { described_class.new.remove_in_reply tweets }

    context 'tweet cannot be a reply to locaweb post' do
      before do
        tweets << build(:tweet_entity,
                        in_reply_to_user_id: ENV['TWITTER_SEARCH_USER_ID'].to_i)
      end

      it_behaves_like 'is expected to be', TweetEntity
      it { expect(subject.size).to eq 4 }
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FilterTweets, type: :business do
  before do
    allow(TwitterRepository).to receive(:list_tweets).and_return(tweets)
  end

  let(:tweets) { build_list(:tweet_entity, 4) }
  let(:attributes_entity) { attributes_for(:tweet_entity) }

  describe '.list' do
    subject { described_class.list }

    context 'create a list of tweet entity' do
      it_behaves_like 'is expected to be', TweetEntity
    end
  end
end

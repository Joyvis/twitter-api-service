# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FilterTweetsByUser, type: :business do
  before do
    allow(TwitterRepository).to receive(:list_tweets_by_user).and_return(users)
  end

  let(:users) { build_list(:user_tweet_entity, 4) }
  let(:attributes_entity) { attributes_for(:user_tweet_entity) }

  describe '.list' do
    subject { described_class.list }

    context 'create a list of user tweets entity' do
      it_behaves_like 'is expected to be', UserTweetEntity
    end
  end
end

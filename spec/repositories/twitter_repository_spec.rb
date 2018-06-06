# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterRepository do
  describe '.most_mentions_tweets' do
    before do
      allow(TwitterService).to receive(:search_tweets_by_screen_name)
    end

    let(:screen_name){ ENV['TWITTER_SEARCH_SCREEN_NAME'] }

    subject { described_class.list_tweets screen_name: screen_name }

    context 'with valid params' do
      it 'tweets listed' do
        subject
      end
    end

    context 'with invalid params' do
      it 'tweets not listed' do
      end
    end
  end
end

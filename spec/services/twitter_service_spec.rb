# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterService, vcr: true do
  describe '.most_mentions_tweets' do
    let(:screen_name){ ENV['TWITTER_SEARCH_SCREEN_NAME'] }
    subject { described_class.search_tweets_by_screen_name screen_name }

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

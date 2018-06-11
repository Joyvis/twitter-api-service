# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwitterService, vcr: true do
  describe '.search_tweets_by_screen_name' do
    let(:screen_name) { ENV['TWITTER_SEARCH_SCREEN_NAME'] }
    subject { described_class.search_tweets_by_screen_name screen_name }

    context 'validating present of necessary fields' do
      it 'tweets listed' do
        expect(subject.first.keys).
          to include('user', 'retweet_count', 'favorite_count', 'text',
                     'created_at', 'in_reply_to_user_id')
      end
    end
  end
end

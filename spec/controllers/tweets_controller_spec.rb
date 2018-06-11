# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  before do
    allow(TwitterRepository).to receive(:list_tweets).and_return(tweets)
    allow(TwitterRepository).to receive(:list_tweets_by_user).and_return(users)
  end

  let(:users) { build_list(:user_tweet_entity, 4) }
  let(:tweets) { build_list(:tweet_entity, 4) }
  let(:body) { JSON.parse(response.body) }

  describe '.most_relevants' do
    before { get :most_relevants }

    it 'success reponse' do
      expect(response).to have_http_status(:success)
      expect(body).to be_a Array
    end
  end

  describe '.most_mentions' do
    before { get :most_mentions }

    it 'success reponse' do
      expect(response).to have_http_status(:success)
      expect(body).to be_a Array
    end
  end
end

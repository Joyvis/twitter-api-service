# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweetEntity, type: :entity do
  let(:attrs) do
    { screen_name: 'teste',
      followers_count: 10,
      retweet_count: 11,
      favorite_count: 12,
      text: 'tweet test @locaweb',
      created_at: 'Mon Sep 24 03:35:21 +0000 2012',
      profile_link: 'http://www.twitter.com/teste',
      link: 'http://www.twitter.com/teste/status/123123',
      in_reply_to_user_id: 22 }
  end

  subject { described_class.new(attrs) }

  describe '#initialize' do
    it 'initializes' do
      attrs.each do |key, value|
        expect(subject.send(key)).to eq(value)
      end
    end
  end
end

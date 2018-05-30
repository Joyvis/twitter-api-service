# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TweepsRepository, vcr: true do
  describe '.most_mentions_tweets' do
    subject { described_class.list_tweets }

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

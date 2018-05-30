# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FilterTweets::MostRelevants, vcr: true do
  describe '.most_mentions_tweets' do
    subject { described_class.list }

    context 'with valid params' do
      it 'tweets listed' do
        binding.pry
        subject
      end
    end

    context 'with invalid params' do
      it 'tweets not listed' do
      end
    end
  end
end

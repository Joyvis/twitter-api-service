# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserTweetEntity, type: :entity do
  let(:attrs) do
    { screen_name: 'teste',
      tweets: build_list(:tweet_entity, 3) }
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

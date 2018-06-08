# frozen_string_literal: true

FactoryBot.define do
  factory :user_tweet_entity do
    screen_name 'teste'
    tweets { build_list :tweet_entity, 3 }

    initialize_with do
      new(attributes)
    end
  end
end

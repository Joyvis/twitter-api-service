# frozen_string_literal: true

class TweetEntity
  ATTRS = %i[
    screen_name followers_count retweet_count favorite_count text created_at
    profile_link link in_reply_to_user_id
  ].freeze

  ATTRS.each { |item| attr_reader item }

  def initialize(attrs = {})
    ATTRS.each { |key| instance_variable_set("@#{key}", attrs[key]) }
  end
end

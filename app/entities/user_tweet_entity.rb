# frozen_string_literal: true

class UserTweetEntity
  ATTRS = %i[user_id screen_name tweeps_list].freeze

  ATTRS.each { |item| attr_reader item }

  def self.attributes
    ATTRS
  end

  def initialize(attrs = {})
    ATTRS.each { |key| instance_variable_set("@#{key}", attrs[key]) }
  end
end

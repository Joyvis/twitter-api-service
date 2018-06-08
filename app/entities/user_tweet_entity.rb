# frozen_string_literal: true

class UserTweetEntity
  ATTRS = %i[screen_name tweets].freeze

  ATTRS.each { |item| attr_accessor item }

  def self.attributes
    ATTRS
  end

  def initialize(attrs = {})
    ATTRS.each { |key| instance_variable_set("@#{key}", attrs[key]) }
  end
end

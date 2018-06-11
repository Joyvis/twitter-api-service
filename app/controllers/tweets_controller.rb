# frozen_string_literal: true

class TweetsController < ApplicationController
  def most_relevants
    render json: FilterTweets.list
  end

  def most_mentions
    render json: FilterTweetsByUser.list
  end
end

Rails.application.routes.draw do
  get '/most_mentions', to: 'tweets#most_mentions'

  get '/most_relevants', to: 'tweets#most_relevants'
end

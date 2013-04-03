require 'bundler'
Bundler.require

require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  set :list_id, "4b6dc9f6f8"
  set :api_key, "80fe3b3813f912cc381ee545e4974f63-us5"
  set :assets_precompile, %w(app.js app.css analytics.js *.png *.jpg *.svg *.eot *.ttf *.woff)

  register Sinatra::AssetPipeline

  get '/' do
    haml :index
  end

  post '/' do
    email = params["email"]

    logger.warn "Enrolling #{email}"

    begin
      h = Hominid::API.new(App.api_key)
      h.list_subscribe(App.list_id, email, {}, 'html', false, true, true, false)
    rescue Exception => exception
      logger.warn "Error #{exception.to_s}"
    end

    @thanks = true

    haml :index
  end
end

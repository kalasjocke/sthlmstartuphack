require 'sinatra'

class App < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/' do
    email = params["email"]

    logger.info "Enrolling #{email}"

    h = Hominid::API.new('80fe3b3813f912cc381ee545e4974f63-us5')

    begin
      id = "4b6dc9f6f8"
      h.list_subscribe(id, email, {}, 'html', false, true, true, false)

      "Yay"
    rescue Exception => exception
      require 'pp'
      pp exception

      "Noo"
    end
  end
end

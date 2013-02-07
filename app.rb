require 'sinatra'

class App < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/' do
    gibbon = Gibbon.new('80fe3b3813f912cc381ee545e4974f63-us5')

    begin
      id = "4b6dc9f6f8"
      gibbon.list_subscribe({:id => id, :email_address => params["email"]})

      "Yay"
    rescue Exception => exception
      require 'pp'
      pp exception

      "Noo"
    end
  end
end

require 'sinatra/base'
require 'rest-client'

class Joke_Api < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  def get_json
    json = RestClient.get "http://api.icndb.com/jokes/random?firstName=The%20Mule&amp;lastName=Doe"
    jhash = JSON.parse(json)
    jhash['value']['joke']
  end

  get '/' do

    @name = get_json
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

# {\"type\"=>\"success\", \"value\"=>
#   {\"id\"=>280, \"joke\"=>\"When John Norris works out on the Total Gym, the Total Gym feels like it's been raped.\", \"categories\"=>[]}}"
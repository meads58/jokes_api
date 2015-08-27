require 'sinatra/base'
require 'rest-client'

class Joke_Api < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }
  set :public_folder, Proc.new { File.join(root, '..', "public") }

  def get_json
    json = RestClient.get "http://api.icndb.com/jokes/random?firstName=Funtime%20Tokyo&amp&lastName=Miln"
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


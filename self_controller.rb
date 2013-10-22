require 'sinatra/base'
require './data_accessor'

class SelfController < Sinatra::Base
  get '/favicon.ico' do
    [404, {}, ""] # don't serve favicon
  end
  
  get '*' do
    @host = request.host
    da = DataAccessor.new
    @new_count = da.add_hit(@host)
    
    erb :hits
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end


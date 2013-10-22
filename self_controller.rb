require 'sinatra/base'
require './data_accessor'

class SelfController < Sinatra::Base
  get '/favicon.ico' do
    [404, {}, ""] # don't serve favicon
  end
  
  get '*' do
    host = request.host
    da = DataAccessor.new
    new_count = da.add_hit(host)
    "You tried #{new_count} hits to #{host} today alone. Better get to work."
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end


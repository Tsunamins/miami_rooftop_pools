

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
   
    enable :sessions
      set :session_secret, "somewordfornow" #review how to use correct authentication
  end

 

  get '/' do
    erb :index
  end



end

class PoolController < ApplicationController
    get '/pools/new_pool' do
        user = Helpers.current_user(session)
        if user.nil?
          redirect to '/login'
        else
          erb :'pools/new_pool'
        end

    end

    post '/pool' do
      user = Helpers.current_user(session)
    if user.nil?
      redirect to '/login'
    elsif params[:pool][:pool_name].empty?
      redirect to '/pools/new_pool'
    else 
      @temporary = params  
      @temporary2 = params[:pool][:id]
      user.save
      erb :'pools/show_pool'
    end
  end 

    get '/pools/:id' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @pool = Pool.find(params[:id])
  
      erb :'/pools/show_pool'
    end
    
  


end 
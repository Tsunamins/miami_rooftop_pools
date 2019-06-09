class PoolController < ApplicationController
  get '/pools' do
    if Helpers.is_logged_in?(session)
      @pools = Pool.all
      erb :'/pools/pools'
    else
      redirect to '/users/login'
    end
  end
  
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
      @pool = Pool.create(params['pool'])
      @pool[:user_id] = user.id
      @pool.save #is this necessary?   
      
      #user.pools.build(params['pool']) #just for notes         
    end  
      redirect to "/pools/#{@pool.id}"      
    
  end 

    get '/pools/:id' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @pool = Pool.find(params[:id])
      @user = Helpers.current_user(session)
  
      erb :'/pools/show_pool'
    end
    
  


end 
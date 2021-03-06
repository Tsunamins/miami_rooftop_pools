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
    elsif (params[:pool][:pool_name].empty? || params[:pool][:building_name].empty?)
            
      redirect to '/pools/new_pool'
    else
      @pool = Pool.create(params['pool'])
      @pool[:user_id] = user.id
      @pool.save 
         
      
      #user.pools.build(params['pool']) #just for notes         
    end  
      redirect to "/pools/#{@pool.id}"     
  end 

    get '/pools/:id' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @pool = Pool.find(params[:id])
      @users = User.all
      erb :'/pools/show_pool'
    end

    get '/pools/:id/edit' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
  
      @pool = Pool.find(params[:id])
      
      #binding.pry
      #was in wrong place
      if @pool.user.id != session["user_id"] 
        redirect to '/user_home'
      elsif @pool.user == Helpers.current_user(session)
          erb :'/pools/edit_pool'
      else
        redirect to '/login'
      end
    end

    patch '/pools/:id' do
      @pool = Pool.find(params[:id])
  
      if @pool.user.id != session["user_id"] 
        redirect to '/user_home'
      elsif params[:pool][:pool_name].empty?
        redirect to "/pools/#{@pool.id}/edit"
      end
  
      @pool.update(params[:pool])
      @pool.save
      redirect to "/pools/#{@pool.id}"
  
    end 

    delete '/pools/:id/delete' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
      #if Helpers.is_logged_in?(session)
        @pool = Pool.find(params[:id])
        if @pool.user == Helpers.current_user(session)
                   
          @pool.delete                  
        end   
        redirect to '/user_home'
    end

    get '/view_all' do 
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @pools = Pool.all
      erb :'pools/all_pools'
    end   

end 
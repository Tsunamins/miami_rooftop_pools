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
      @pool.user_id 
      get_user = @pool.user_id
      @match_user = @users.detect {|match_id| match_id.id == get_user}
      # match_user.id will get id number
      # match_user.username will get username

      
      erb :'/pools/show_pool'
    end

    get '/pools/:id/edit' do
      redirect to '/login' unless Helpers.is_logged_in?(session)
  
      @pool = Pool.find(params[:id])
      if @pool.user == Helpers.current_user(session)
          erb :'/pools/edit_pool'
      else
        redirect to '/login'
      end
    end

    patch '/pools/:id' do
      @pool = Pool.find(params[:id])
  
      if params[:pool][:pool_name].empty?
        redirect to "/pools/#{@pool.id}/edit"
      end
  
      @pool.update(params[:pool])
      @pool.save
      redirect to "/pools/#{@pool.id}"
  
    end 

    delete '/pools/:id/delete' do
      if Helpers.is_logged_in?(session)
        @pool = Pool.find(params[:id])
        if @pool.user == Helpers.current_user(session)
          @pool = Pool.find_by_id(params[:id])
          @pool.delete
          redirect to '/user_home'
          
        else
          redirect to '/user_home'
        end
      else
        redirect to '/login'
      
    end
  end

    get '/view_all' do 
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @pools = Pool.all
      erb :'pools/all_pools'
    end

    get '/view_user' do
      if Helpers.is_logged_in?(session)
        @users = User.all
        @pools = Pool.all
        erb :'/pools/view_user_pools'
      else
        redirect to '/users/login'
      end
    end

    get '/view_user/:username' do 
      redirect to '/login' unless Helpers.is_logged_in?(session)
      @username = Pool.find(params[:username])
      

      
      #add some get variable data here @User.all for example
      #add variable to search for a user to link to their page
      #going to need username and user_id, etc.
      erb :'pools/view_user_pools'
    end

end 
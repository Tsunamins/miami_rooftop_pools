class UserController < ApplicationController 

    get '/signup' do 
        if Helpers.is_logged_in?(session)
            redirect to '/pools'
          end
        erb :'/users/new_user'
    end 

    post '/signup' do 
        if Helpers.is_logged_in?(session)
            redirect to '/pools'
          elsif !(params.has_value?(""))
            @user = User.create(params)
            binding.pry
            session["user_id"] = @user.id
           
            redirect to '/user_home'
          else
            redirect to '/signup'
          end
        end

    get '/login' do 
        if Helpers.is_logged_in?(session)
            redirect to '/user_home'
          end
          erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
            if @user && @user.authenticate(params[:password])
            session["user_id"] = @user.id
            
            redirect to "/user_home"
            
          else
            redirect to "/login"
          end
    end

    get '/user_home' do 
     
        @user = Helpers.current_user(session)
        @pool_user_match = @user.id
        @pools = Pool.all 
        
       
        
      
        erb :'users/show_user_home'
        
        
    end 

    post '/logout' do 
      if Helpers.is_logged_in?(session)
        session.clear 
      else 
        redirect to '/'
      end 
        redirect to '/login'
     
    end 




end 
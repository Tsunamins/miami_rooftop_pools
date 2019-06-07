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
        erb :'users/show_user_home'
    end 




end 
class PoolController < ApplicationController
    get '/pools/new_pool' do
        user = Helpers.current_user(session)
        if user.nil?
          redirect to '/login'
        else
          erb :'pools/new_pool'
        end
    end
end 
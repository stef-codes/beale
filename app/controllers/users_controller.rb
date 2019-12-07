class UsersController < ApplicationController
    get '/signup' do
        erb :'/users/new'
      end

    post '/signup' do
        @user = User.new(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
    
        puts params
    
        redirect '/login'
    end
end 
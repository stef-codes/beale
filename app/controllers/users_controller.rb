class UsersController < ApplicationController
    get '/signup' do
        erb :'/users/new'
      end

    post '/signup' do
         if  params[:email].empty? || params[:password].empty?

              erb :'users/new_error'
         else 
            @user = User.create(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
            @user.save
            session[:user_id] = @user.id
    
            redirect '/login'
         end 
    end




end 
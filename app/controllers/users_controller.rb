class UsersController < ApplicationController
<<<<<<< HEAD
    get '/signup' do
        erb :'/users/new'
     end
=======
  get '/signup' do
    erb :'/users/new'
  end
>>>>>>> origin/master

  post '/signup' do
    if  params[:email].empty? || params[:password].empty?

      erb :'users/new_error'
    else 
      @user = User.create(first_name: params["first_name"], last_name: params["last_name"], email: params["email"], password: params["password"])
      @user.save
      session[:user_id] = @user.id

      redirect '/books'
    end 
  end
end 

class BooksController < ApplicationController

    get '/books' do 
        if logged_in?
            @user = current_user
            @books = @user.books
            erb :'books/index'
        else 
            redirect '/login' #must be loggedin to visit books page
        end 
    end
    

    get '/books/new' do 
        erb :'books/new'
    end

    post '/books' do
        user = User.find_by(id: params[:user_id])
        book = user.books.build(params)

        redirect '/books'
       
    end 


    get '/books/:id' do 
        @book = Book.find_by(id: params[:id])
        if @book
            erb :'books/show'
        else 
            redirect '/books'
        end 
    end
    
    get '/books/:id/edit' do 
        user = Book.find_by(id: params[:id]).user
        if user.id == current_user
            @book = user.books.find_by(id: params[:id])
            erb :'books/edit'
        else 
            redirect '/books'
        end  
    end
    
    patch '/books/:id' do 
        user = Book.find_by(id: params[:id]).user
        if user.id == current_user
            @book = user.books.find_by(id: params[:id]) 
            if @book.update(title: params[:title], author: params[:author], genre: params[:genre])
                redirect "/books/#{@book.id}"
            else 
                redirect "/books/#{@book.id}/edit"
            end
        else 
            redirect '/books'
        end 
    end
    
    delete '/books/:id' do 
        @book = Book.find_by(id: params[:id]) 
        @book.delete 
        redirect '/books'
    end 
end 
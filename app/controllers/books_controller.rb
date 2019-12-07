class BooksController < ApplicationController
    get '/books' do 
        @books = Book.all 
        erb :'books/index'
    end
    

    get '/books/new' do 
        @users = User.all
        erb :'books/new'
    end

    post '/books' do
        user = User.find_by(id: params[:user_id])
        book = user.books.build(params) 
        if book.save
            redirect "/books"
        else
            redirect "/books/new"
        end 
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
        @users = User.all
        @book = Book.find_by(id: params[:id])
        erb :'books/edit'
    end
    
    patch '/books/:id' do 
        @book = Book.find_by(id: params[:id]) 
        if @book.update(title: params[:title], author: params[:author], genre: params[:genre])
            redirect "/books/#{@book.id}"
        else 
            redirect "/books/#{@book.id}/edit"
        end
    end 
end 
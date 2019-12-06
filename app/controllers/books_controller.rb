class BooksController < ApplicationController
    get '/books' do 
        @books = Book.all 
        erb :'books/index'
    end
    

    get '/books/new' do 
        @users = User.all
        erb :'books/new'
    end


    get '/books/:id' do 
        @book = Book.find_by(id: params[:id])
        if @book
            erb:'books/show'
        else 
            redirect '/books'
        end 
    end 
end 
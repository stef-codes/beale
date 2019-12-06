class BooksController < ApplicationController
    get '/books' do 
        @books = Books.all 
        erb :'books/index'
end 
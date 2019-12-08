class BooksController < ApplicationController

    get '/books' do 
          if logged_in?
             user = current_user
            # @user = User.all 
              @books = user.books
            #  @books = Book.all
            erb :'books/index'
          else 
        #     redirect '/login' #must be loggedin to visit books page
                puts "no books"
          end 
    end
    

    get '/books/new' do 
        if logged_in?
            erb :'books/new'
        else 
            redirect '/books'
        end 
    end

    post '/books' do
        user = current_user
        @book = user.books.find_or_create_by(params)

        if @book.save
            erb :'books/show'
        else 
            redirect '/books'
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
        if current_user
            @book = current_user.books.find_by(id: params[:id])
            erb :'books/edit'
        else 
            redirect '/books'
        end  
    end
    
    patch '/books/:id' do 
        if current_user
            @book = current_user.books.find_by(id: params[:id]) 
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
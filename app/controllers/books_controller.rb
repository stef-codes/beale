class BooksController < ApplicationController
  get '/books' do 
    redirect_not_logged_in
    @books = current_user.books
    erb :'books/index'
  end


<<<<<<< HEAD
    get '/books' do 
          if logged_in?
             user = current_user
              @books = user.books
            erb :'books/index'
          else 
             redirect '/login' 
          end 
    end
    
=======
  get '/books/new' do 
    if logged_in?
      erb :'books/new'
    else 
      redirect '/books'
    end 
  end
>>>>>>> origin/master

  post '/books' do
    @book = current_user.books.find_or_create_by(params)

    if @book.save
      erb :'books/show'
    else 
      redirect '/books'
    end
  end 


<<<<<<< HEAD
=======
  get '/books/:id' do
    if logged_in?
        @book = current_user.books.find_by(id: params[:id])
>>>>>>> origin/master
        if @book
            erb :'books/show'
        else 
            redirect '/books'
        end
    else 
        redirect '/login' 
    end  
end

get '/books/:id/edit' do 
  if current_user
      @book = current_user.books.find_by(id: params[:id])
      if @book
          erb :'books/edit'
      else 
          redirect '/books'
      end
  else 
      redirect '/books'
  end  
end

<<<<<<< HEAD
    get '/books/:id' do
        if logged_in?
            user = current_user
            @book = current_user.books.find_by(id: params[:id])
            if @book
                erb :'books/show'
            else 
                redirect '/books'
            end
        else 
            redirect '/login' 
        end  
    end
    
    get '/books/:id/edit' do 
        if current_user
            @book = current_user.books.find_by(id: params[:id])
            if @book
                erb :'books/edit'
            else 
                redirect '/books'
            end
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
        @book = current_user.books.find_by(id: params[:id]) 
        if @book
            @book.delete 
        end 
        redirect '/books'
=======
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
>>>>>>> origin/master
    end 
  end

  delete '/books/:id' do 
    @book = Book.find_by(id: params[:id]) 
    @book.delete 
    redirect '/books'
  end 
end 

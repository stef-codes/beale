10.times do 
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.free_email)
    5.times do 
        user.books.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre)
    end 
end 
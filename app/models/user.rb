class User < ActiveRecord::Base
    has_many :books 
    has_secure_password
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
end 
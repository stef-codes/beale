class User < ActiveRecord::Base
    has_many :books 
    has_secure_password
    validates :email, presence: true
    validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ , message: "please enter a valid email address" }
    validates :password, presence: true
    validates :email, uniqueness: true

    def email_error_validation
        errors.add(:email, "please enter a valid email address")
      end
end 
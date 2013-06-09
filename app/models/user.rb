require 'bcrypt'

class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation
    # password is not persistent in the DB
    attr_accessor :password


    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email 

    def self.authenticate(email, password)
        u = self.find_by_email(email)
        if u && u.password_hash == BCrypt::Engine.hash_secret(password, u.password_salt)
            return u
        else
            return nil
        end
    end
    private

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end

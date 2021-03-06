require 'bcrypt'

class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation
    # password is not persistent in the DB
    attr_accessor :password

    has_many :friendships
    has_many :friends, :through => :friendships

    has_many :interests
    has_many :performers, :through => :interests

    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :password_confirmation, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email
    validates :email, format: { :with => /(?>(?:[0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+)[a-zA-Z]{2,9}/, message: "%{value} is not a valid email address" }

    def self.authenticate(params)
        email = params[:email]
        password = params[:password]
        u = self.find_by_email(email)
        if u && u.password_hash == BCrypt::Engine.hash_secret(password, u.password_salt)
            return u
        else
            return nil
        end
    end

    def as_json(options = {})
        super options.merge(:only => [:id, :email])
    end

    private

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end

end

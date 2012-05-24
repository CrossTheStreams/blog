class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation 


  attr_accessor :password    
  before_save :encrypt_pw

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_pw
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end

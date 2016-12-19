class User < ActiveRecord::Base
	attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :phone
  validates_uniqueness_of :email
  validates_uniqueness_of :phone
  
  def self.authenticate(email, password)
    obj = find_by_email(email)
    if obj && obj.password_hash == BCrypt::Engine.hash_secret(password, obj.password_salt)
      obj
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.search(query)
    where do 
      (firstname =~ "#{query}") |
      (kod =~ "%#{query}%")
    end   
  end
end

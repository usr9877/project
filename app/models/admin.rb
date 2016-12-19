class Admin < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :kod
  validates_presence_of :phone
  validates_uniqueness_of :email
  validates_uniqueness_of :phone
  validates_uniqueness_of :kod
  
  def self.authenticate(kod, password)
    admin = find_by_kod(kod)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
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

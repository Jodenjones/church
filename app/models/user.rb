require 'digest'
class User < ActiveRecord::Base
  before_save :encrypt_password
  attr_accessor :password
  
  has_one :profile
  accepts_nested_attributes_for :profile
    
  def self.authenticate(email,password)
    user = User.find_by_email(email)
    return user if user.hashed_password == encrypt(password)
  end
  
  def encrypt_password
    self.hashed_password = User.encrypt(password)
  end
  
  protected 
  
    def self.encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
  
end

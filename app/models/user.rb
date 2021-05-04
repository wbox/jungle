class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true

  validates :password, presence: true
  validates :password, length: { 6..20 }
  
  validates :password_confirmation, presence: true
  
  validates :email, presence: true
  validates :email, { case_sensitive: false }
  validates :email, uniqueness: true




end

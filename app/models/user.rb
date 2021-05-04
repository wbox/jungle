class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true, length: { minimum: 3 }
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :sanitize_email

  def sanitize_email
    self.email.downcase!
    self.email.strip!
  end

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase); 
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end

end
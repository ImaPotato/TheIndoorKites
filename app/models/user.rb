class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :password, presence: true, :on => :create, confirmation: true
  validates :email, presence: true, uniqueness: true

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      #errors.add 'Email or Password is incorrect'
    end
  end

  def email_regex
    if not email.match(/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/)
      #errors.add :email, 'Please enter a valid email address'
    end
  end

end

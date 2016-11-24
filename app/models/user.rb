class User < ApplicationRecord
  
  before_save :encrypt_password
  
  validates_confirmation_of :password_hash
  validates_presence_of :password_hash, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    @email = email
    user = find_by_email(email)
    if user && user.password_hash == Digest::SHA2.hexdigest(user.password_salt + password)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password_hash.present?
      self.password_salt = SecureRandom.base64(8)
      self.password_hash = Digest::SHA2.hexdigest(self.password_salt + password_hash)
    end
  end
end

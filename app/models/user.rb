class User < ActiveRecord::Base
  has_many :goals
  
  validates :email, uniqueness: true
  validates :password, confirmation: true

  before_save :encrypt_password, :generate_token

  def self.authenticate(email, password)
    User.find_by email: email, password: Digest::MD5.hexdigest(password)
  end

  def encrypt_password
    self.password = Digest::MD5.hexdigest(self.password)
  end

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end
end

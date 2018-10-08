class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password
  after_initialize :ensure_token

  def ensure_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(pword)
    @password = pword
    self.password_digest = BCrypt::Password.create(pword)
  end

  def is_password?(pword)
    BCrypt::Password.new(self.password_digest).is_password?(pword)
  end

  def self.find_by_credentials(uname, pword)
    user = User.find_by(username: uname)
    user && user.is_password?(pword) ? user : nil
  end


end

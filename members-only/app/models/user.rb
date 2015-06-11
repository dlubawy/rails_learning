class User < ActiveRecord::Base
  # Before saving to database, lowercase the email
  before_save {self.email = email.downcase}
  before_create :create_remember_token

  validates :name, presence: true, length: {maximum: 20}
  # Regular expression for a valid email address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false},
                    allow_nil: true
  # For use with bcrypt
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}  

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
